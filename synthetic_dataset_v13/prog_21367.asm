; DESCRIPTION: Renders a red line between points (347, 23) and (392, 234).
; PLAN: r0=347(x1), r1=23(y1), r2=392(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 23
LDI r2, 392
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
