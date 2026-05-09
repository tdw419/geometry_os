; DESCRIPTION: Renders a blue line between points (241, 152) and (126, 221).
; PLAN: r0=241(x1), r1=152(y1), r2=126(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 152
LDI r2, 126
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
