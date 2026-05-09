; DESCRIPTION: Draws a white line from (284, 9) to (396, 132).
; PLAN: r0=284(x1), r1=9(y1), r2=396(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 9
LDI r2, 396
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
