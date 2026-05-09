; DESCRIPTION: Draws a white line from (284, 96) to (312, 178).
; PLAN: r0=284(x1), r1=96(y1), r2=312(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 96
LDI r2, 312
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
