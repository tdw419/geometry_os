; DESCRIPTION: Renders a magenta line between points (299, 249) and (117, 38).
; PLAN: r0=299(x1), r1=249(y1), r2=117(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 249
LDI r2, 117
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
