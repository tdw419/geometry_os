; DESCRIPTION: Composite: Places a green line segment connecting (99, 27) to (309, 243) then Renders a purple box of size 15x73 starting at (359, 3).
; PLAN: r0=99(x1), r1=27(y1), r2=309(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=3(y), r7=15(width), r8=73(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 27
LDI r2, 309
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 3
LDI r7, 15
LDI r8, 73
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
