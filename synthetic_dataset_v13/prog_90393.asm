; DESCRIPTION: Draws a green line from (154, 32) to (427, 223).
; PLAN: r0=154(x1), r1=32(y1), r2=427(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 32
LDI r2, 427
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
