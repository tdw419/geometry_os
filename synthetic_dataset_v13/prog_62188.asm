; DESCRIPTION: Renders a cyan line between points (223, 69) and (347, 21).
; PLAN: r0=223(x1), r1=69(y1), r2=347(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 69
LDI r2, 347
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
