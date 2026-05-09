; DESCRIPTION: Renders a cyan line between points (122, 254) and (474, 32).
; PLAN: r0=122(x1), r1=254(y1), r2=474(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 254
LDI r2, 474
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
