; DESCRIPTION: Draws a white line from (393, 125) to (221, 222).
; PLAN: r0=393(x1), r1=125(y1), r2=221(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 125
LDI r2, 221
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
