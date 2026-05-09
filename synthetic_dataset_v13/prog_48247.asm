; DESCRIPTION: Composite: Draws a black line from (226, 222) to (482, 188) then Places a green circle of radius 23 at center (473, 177).
; PLAN: r0=226(x1), r1=222(y1), r2=482(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=473(x), r6=177(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 226
LDI r1, 222
LDI r2, 482
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 177
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
