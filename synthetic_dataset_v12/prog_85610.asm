; DESCRIPTION: Renders a black line between points (210, 205) and (271, 169).
; PLAN: r0=210(x1), r1=205(y1), r2=271(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 205
LDI r2, 271
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
