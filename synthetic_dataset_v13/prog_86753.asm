; DESCRIPTION: Renders a black line between points (69, 223) and (259, 208).
; PLAN: r0=69(x1), r1=223(y1), r2=259(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 223
LDI r2, 259
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
