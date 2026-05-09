; DESCRIPTION: Draws a green line from (187, 125) to (188, 184).
; PLAN: r0=187(x1), r1=125(y1), r2=188(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 125
LDI r2, 188
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
