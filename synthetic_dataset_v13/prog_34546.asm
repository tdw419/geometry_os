; DESCRIPTION: Renders a white line between points (203, 181) and (412, 249).
; PLAN: r0=203(x1), r1=181(y1), r2=412(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 181
LDI r2, 412
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
