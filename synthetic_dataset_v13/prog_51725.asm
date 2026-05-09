; DESCRIPTION: Renders a green line between points (203, 44) and (74, 192).
; PLAN: r0=203(x1), r1=44(y1), r2=74(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 44
LDI r2, 74
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
