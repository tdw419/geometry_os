; DESCRIPTION: Renders a orange line between points (294, 197) and (407, 248).
; PLAN: r0=294(x1), r1=197(y1), r2=407(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 197
LDI r2, 407
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
