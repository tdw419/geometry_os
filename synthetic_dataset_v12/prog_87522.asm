; DESCRIPTION: Composite: Draws a black line from (462, 56) to (433, 97) then Places a magenta circle of radius 71 at center (400, 127).
; PLAN: r0=462(x1), r1=56(y1), r2=433(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=127(y), r7=71(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 462
LDI r1, 56
LDI r2, 433
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 127
LDI r7, 71
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
