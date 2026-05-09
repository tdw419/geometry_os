; DESCRIPTION: Renders a red line between points (173, 31) and (48, 137).
; PLAN: r0=173(x1), r1=31(y1), r2=48(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 31
LDI r2, 48
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
