; DESCRIPTION: Draws a white line from (400, 14) to (168, 9).
; PLAN: r0=400(x1), r1=14(y1), r2=168(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 14
LDI r2, 168
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
