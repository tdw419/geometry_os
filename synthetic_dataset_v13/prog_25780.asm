; DESCRIPTION: Composite: Draws a yellow line from (207, 216) to (385, 22) then Places a magenta circle of radius 39 at center (417, 127).
; PLAN: r0=207(x1), r1=216(y1), r2=385(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=127(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 207
LDI r1, 216
LDI r2, 385
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 127
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
