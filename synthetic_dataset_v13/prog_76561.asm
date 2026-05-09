; DESCRIPTION: Renders a cyan line between points (474, 151) and (407, 247).
; PLAN: r0=474(x1), r1=151(y1), r2=407(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 151
LDI r2, 407
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
