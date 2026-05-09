; DESCRIPTION: Draws a green line from (0, 46) to (159, 128).
; PLAN: r0=0(x1), r1=46(y1), r2=159(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 46
LDI r2, 159
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
