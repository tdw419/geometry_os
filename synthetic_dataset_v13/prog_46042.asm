; DESCRIPTION: Draws a white line from (168, 105) to (168, 160).
; PLAN: r0=168(x1), r1=105(y1), r2=168(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 105
LDI r2, 168
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
