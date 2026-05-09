; DESCRIPTION: Draws a green line from (241, 248) to (254, 254).
; PLAN: r0=241(x1), r1=248(y1), r2=254(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 248
LDI r2, 254
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
