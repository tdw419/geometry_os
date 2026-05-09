; DESCRIPTION: Composite: Draws a blue line from (448, 70) to (479, 199) then Places a blue circle of radius 59 at center (216, 156).
; PLAN: r0=448(x1), r1=70(y1), r2=479(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=156(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 448
LDI r1, 70
LDI r2, 479
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 156
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
