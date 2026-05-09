; DESCRIPTION: Renders a cyan line between points (112, 10) and (221, 184).
; PLAN: r0=112(x1), r1=10(y1), r2=221(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 10
LDI r2, 221
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
