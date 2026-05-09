; DESCRIPTION: Renders a black line between points (202, 103) and (123, 70).
; PLAN: r0=202(x1), r1=103(y1), r2=123(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 103
LDI r2, 123
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
