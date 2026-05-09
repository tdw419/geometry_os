; DESCRIPTION: Composite: Places a cyan dot at position (104, 136) then Creates a red rectangular region at (296, 198) spanning 107 by 33 pixels.
; PLAN: r0=104(x), r1=136(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=198(y), r7=107(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 136
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 198
LDI r7, 107
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
