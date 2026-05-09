; DESCRIPTION: Composite: Renders a purple disk with center (464, 86) and radius 34 then Draws a white line from (279, 138) to (434, 249).
; PLAN: r0=464(x), r1=86(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x1), r6=138(y1), r7=434(x2), r8=249(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 86
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 138
LDI r7, 434
LDI r8, 249
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
