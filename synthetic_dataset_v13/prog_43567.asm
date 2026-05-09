; DESCRIPTION: Draws a green line from (54, 184) to (394, 98).
; PLAN: r0=54(x1), r1=184(y1), r2=394(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 184
LDI r2, 394
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
