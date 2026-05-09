; DESCRIPTION: Composite: Renders a red box of size 68x118 starting at (84, 110) then Places a cyan dot at position (145, 6).
; PLAN: r0=84(x), r1=110(y), r2=68(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=6(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 84
LDI r1, 110
LDI r2, 68
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 6
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
