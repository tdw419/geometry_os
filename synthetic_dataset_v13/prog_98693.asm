; DESCRIPTION: Composite: Draws a blue line from (481, 43) to (317, 253) then Places a black circle of radius 12 at center (206, 209).
; PLAN: r0=481(x1), r1=43(y1), r2=317(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=209(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 481
LDI r1, 43
LDI r2, 317
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 209
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
