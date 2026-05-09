; DESCRIPTION: Draws a white line from (198, 173) to (109, 102).
; PLAN: r0=198(x1), r1=173(y1), r2=109(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 173
LDI r2, 109
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
