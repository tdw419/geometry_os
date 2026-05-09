; DESCRIPTION: Draws a green line from (268, 181) to (103, 223).
; PLAN: r0=268(x1), r1=181(y1), r2=103(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 181
LDI r2, 103
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
