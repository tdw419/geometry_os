; DESCRIPTION: Renders a green line between points (141, 236) and (509, 249).
; PLAN: r0=141(x1), r1=236(y1), r2=509(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 236
LDI r2, 509
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
