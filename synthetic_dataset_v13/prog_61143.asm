; DESCRIPTION: Renders a cyan line between points (124, 223) and (8, 188).
; PLAN: r0=124(x1), r1=223(y1), r2=8(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 223
LDI r2, 8
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
