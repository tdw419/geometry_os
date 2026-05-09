; DESCRIPTION: Composite: Draws a blue line from (19, 88) to (59, 8) then Places a white circle of radius 27 at center (388, 196).
; PLAN: r0=19(x1), r1=88(y1), r2=59(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=196(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 19
LDI r1, 88
LDI r2, 59
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 196
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
