; DESCRIPTION: Renders a cyan line between points (466, 29) and (181, 126).
; PLAN: r0=466(x1), r1=29(y1), r2=181(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 29
LDI r2, 181
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
