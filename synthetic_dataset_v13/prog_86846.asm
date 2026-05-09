; DESCRIPTION: Composite: Places a purple dot at position (145, 179) then Renders a green box of size 99x110 starting at (208, 145).
; PLAN: r0=145(x), r1=179(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=208(x), r6=145(y), r7=99(width), r8=110(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 179
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 208
LDI r6, 145
LDI r7, 99
LDI r8, 110
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
