; DESCRIPTION: Draws a white line from (106, 39) to (184, 193).
; PLAN: r0=106(x1), r1=39(y1), r2=184(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 39
LDI r2, 184
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
