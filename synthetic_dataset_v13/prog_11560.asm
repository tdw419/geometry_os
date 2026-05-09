; DESCRIPTION: Renders a green line between points (288, 126) and (35, 19).
; PLAN: r0=288(x1), r1=126(y1), r2=35(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 126
LDI r2, 35
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
