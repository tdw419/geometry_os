; DESCRIPTION: Composite: Draws a white line from (455, 5) to (498, 115) then Places a blue circle of radius 52 at center (255, 153).
; PLAN: r0=455(x1), r1=5(y1), r2=498(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=153(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 455
LDI r1, 5
LDI r2, 498
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 153
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
