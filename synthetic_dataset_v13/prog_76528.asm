; DESCRIPTION: Draws a orange line from (68, 165) to (284, 223).
; PLAN: r0=68(x1), r1=165(y1), r2=284(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 165
LDI r2, 284
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
