; DESCRIPTION: Renders a white line between points (97, 177) and (271, 198).
; PLAN: r0=97(x1), r1=177(y1), r2=271(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 177
LDI r2, 271
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
