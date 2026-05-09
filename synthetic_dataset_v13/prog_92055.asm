; DESCRIPTION: Composite: Draws a green line from (288, 192) to (39, 37) then Draws a green circle centered at (162, 59) with radius 33.
; PLAN: r0=288(x1), r1=192(y1), r2=39(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=59(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 192
LDI r2, 39
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 59
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
