; DESCRIPTION: Renders a cyan line between points (474, 150) and (77, 254).
; PLAN: r0=474(x1), r1=150(y1), r2=77(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 150
LDI r2, 77
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
