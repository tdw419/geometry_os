; DESCRIPTION: Composite: Places a cyan dot at position (143, 247) then Places a red 57x58 rectangle at position (299, 170).
; PLAN: r0=143(x), r1=247(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=170(y), r7=57(width), r8=58(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 247
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 299
LDI r6, 170
LDI r7, 57
LDI r8, 58
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
