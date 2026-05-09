; DESCRIPTION: Composite: Draws a black line from (501, 87) to (64, 54) then Creates a green rectangular region at (146, 176) spanning 18 by 27 pixels.
; PLAN: r0=501(x1), r1=87(y1), r2=64(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=176(y), r7=18(width), r8=27(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 501
LDI r1, 87
LDI r2, 64
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 176
LDI r7, 18
LDI r8, 27
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
