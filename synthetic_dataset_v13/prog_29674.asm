; DESCRIPTION: Renders a orange line between points (66, 206) and (320, 45).
; PLAN: r0=66(x1), r1=206(y1), r2=320(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 206
LDI r2, 320
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
