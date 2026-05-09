; DESCRIPTION: Composite: Places a red dot at position (150, 78) then Places a purple 25x84 rectangle at position (432, 4).
; PLAN: r0=150(x), r1=78(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=4(y), r7=25(width), r8=84(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 78
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 432
LDI r6, 4
LDI r7, 25
LDI r8, 84
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
