; DESCRIPTION: Renders a green line between points (431, 234) and (38, 113).
; PLAN: r0=431(x1), r1=234(y1), r2=38(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 234
LDI r2, 38
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
