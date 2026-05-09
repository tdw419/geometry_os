; DESCRIPTION: Renders a white line between points (469, 173) and (132, 5).
; PLAN: r0=469(x1), r1=173(y1), r2=132(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 173
LDI r2, 132
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
