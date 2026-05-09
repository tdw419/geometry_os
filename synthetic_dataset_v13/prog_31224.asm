; DESCRIPTION: Draws a white line from (197, 192) to (172, 76).
; PLAN: r0=197(x1), r1=192(y1), r2=172(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 192
LDI r2, 172
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
