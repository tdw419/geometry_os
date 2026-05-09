; DESCRIPTION: Renders a blue line between points (284, 74) and (123, 217).
; PLAN: r0=284(x1), r1=74(y1), r2=123(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 74
LDI r2, 123
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
