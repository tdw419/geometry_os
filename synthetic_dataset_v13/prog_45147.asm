; DESCRIPTION: Renders a cyan line between points (331, 6) and (113, 93).
; PLAN: r0=331(x1), r1=6(y1), r2=113(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 6
LDI r2, 113
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
