; DESCRIPTION: Renders a yellow line between points (265, 231) and (280, 180).
; PLAN: r0=265(x1), r1=231(y1), r2=280(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 231
LDI r2, 280
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
