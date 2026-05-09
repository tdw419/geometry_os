; DESCRIPTION: Renders a white line between points (389, 239) and (438, 144).
; PLAN: r0=389(x1), r1=239(y1), r2=438(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 239
LDI r2, 438
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
