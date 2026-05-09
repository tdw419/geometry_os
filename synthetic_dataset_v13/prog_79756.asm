; DESCRIPTION: Renders a cyan line between points (60, 24) and (112, 237).
; PLAN: r0=60(x1), r1=24(y1), r2=112(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 24
LDI r2, 112
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
