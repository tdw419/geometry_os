; DESCRIPTION: Composite: Draws a blue line from (263, 255) to (221, 138) then Renders a purple disk with center (262, 128) and radius 77.
; PLAN: r0=263(x1), r1=255(y1), r2=221(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=128(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 255
LDI r2, 221
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 128
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
