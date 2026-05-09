; DESCRIPTION: Renders a green line between points (123, 164) and (152, 129).
; PLAN: r0=123(x1), r1=164(y1), r2=152(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 164
LDI r2, 152
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
