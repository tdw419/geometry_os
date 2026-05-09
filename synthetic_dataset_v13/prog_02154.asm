; DESCRIPTION: Renders a orange line between points (272, 195) and (224, 69).
; PLAN: r0=272(x1), r1=195(y1), r2=224(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 195
LDI r2, 224
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
