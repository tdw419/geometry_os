; DESCRIPTION: Draws a white line from (184, 243) to (192, 225).
; PLAN: r0=184(x1), r1=243(y1), r2=192(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 243
LDI r2, 192
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
