; DESCRIPTION: Renders a white line between points (27, 36) and (231, 47).
; PLAN: r0=27(x1), r1=36(y1), r2=231(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 36
LDI r2, 231
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
