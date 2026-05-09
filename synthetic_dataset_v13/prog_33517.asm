; DESCRIPTION: Renders a red line between points (492, 237) and (108, 152).
; PLAN: r0=492(x1), r1=237(y1), r2=108(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 237
LDI r2, 108
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
