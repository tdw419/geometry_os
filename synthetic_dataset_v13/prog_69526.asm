; DESCRIPTION: Composite: Places a black dot at position (443, 221) then Creates a cyan rectangular region at (213, 111) spanning 78 by 58 pixels.
; PLAN: r0=443(x), r1=221(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=213(x), r6=111(y), r7=78(width), r8=58(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 221
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 213
LDI r6, 111
LDI r7, 78
LDI r8, 58
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
