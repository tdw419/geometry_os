; DESCRIPTION: Renders a white line between points (295, 209) and (506, 137).
; PLAN: r0=295(x1), r1=209(y1), r2=506(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 209
LDI r2, 506
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
