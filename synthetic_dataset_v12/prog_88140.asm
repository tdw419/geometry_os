; DESCRIPTION: Renders a green line between points (459, 173) and (407, 250).
; PLAN: r0=459(x1), r1=173(y1), r2=407(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 173
LDI r2, 407
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
