; DESCRIPTION: Draws a white line from (214, 42) to (118, 110).
; PLAN: r0=214(x1), r1=42(y1), r2=118(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 42
LDI r2, 118
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
