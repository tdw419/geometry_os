; DESCRIPTION: Renders a black line between points (396, 186) and (438, 113).
; PLAN: r0=396(x1), r1=186(y1), r2=438(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 186
LDI r2, 438
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
