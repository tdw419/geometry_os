; DESCRIPTION: Renders a cyan line between points (87, 196) and (505, 169).
; PLAN: r0=87(x1), r1=196(y1), r2=505(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 196
LDI r2, 505
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
