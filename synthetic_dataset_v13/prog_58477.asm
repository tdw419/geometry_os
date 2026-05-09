; DESCRIPTION: Draws a orange line from (42, 165) to (215, 28).
; PLAN: r0=42(x1), r1=165(y1), r2=215(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 165
LDI r2, 215
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
