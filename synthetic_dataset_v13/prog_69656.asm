; DESCRIPTION: Draws a blue line from (71, 174) to (126, 57).
; PLAN: r0=71(x1), r1=174(y1), r2=126(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 174
LDI r2, 126
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
