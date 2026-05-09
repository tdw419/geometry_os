; DESCRIPTION: Renders a black line between points (69, 95) and (482, 234).
; PLAN: r0=69(x1), r1=95(y1), r2=482(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 95
LDI r2, 482
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
