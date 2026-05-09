; DESCRIPTION: Renders a white line between points (265, 209) and (474, 50).
; PLAN: r0=265(x1), r1=209(y1), r2=474(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 209
LDI r2, 474
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
