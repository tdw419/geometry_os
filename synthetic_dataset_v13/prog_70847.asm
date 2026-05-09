; DESCRIPTION: Renders a green line between points (173, 72) and (288, 14).
; PLAN: r0=173(x1), r1=72(y1), r2=288(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 72
LDI r2, 288
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
