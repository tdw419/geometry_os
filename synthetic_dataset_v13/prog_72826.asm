; DESCRIPTION: Renders a cyan line between points (347, 149) and (314, 113).
; PLAN: r0=347(x1), r1=149(y1), r2=314(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 149
LDI r2, 314
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
