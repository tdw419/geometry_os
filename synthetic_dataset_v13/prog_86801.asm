; DESCRIPTION: Draws a white line from (282, 229) to (172, 146).
; PLAN: r0=282(x1), r1=229(y1), r2=172(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 229
LDI r2, 172
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
