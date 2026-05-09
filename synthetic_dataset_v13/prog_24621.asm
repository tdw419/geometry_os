; DESCRIPTION: Renders a green line between points (173, 28) and (454, 108).
; PLAN: r0=173(x1), r1=28(y1), r2=454(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 28
LDI r2, 454
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
