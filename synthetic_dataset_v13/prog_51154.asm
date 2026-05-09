; DESCRIPTION: Renders a cyan line between points (506, 79) and (385, 176).
; PLAN: r0=506(x1), r1=79(y1), r2=385(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 79
LDI r2, 385
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
