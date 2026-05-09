; DESCRIPTION: Draws a white line from (79, 27) to (63, 42).
; PLAN: r0=79(x1), r1=27(y1), r2=63(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 27
LDI r2, 63
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
