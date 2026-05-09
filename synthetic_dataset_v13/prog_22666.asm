; DESCRIPTION: Composite: Renders a green box of size 23x39 starting at (454, 160) then Places a magenta line segment connecting (470, 142) to (406, 247).
; PLAN: r0=454(x), r1=160(y), r2=23(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x1), r6=142(y1), r7=406(x2), r8=247(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 160
LDI r2, 23
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 142
LDI r7, 406
LDI r8, 247
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
