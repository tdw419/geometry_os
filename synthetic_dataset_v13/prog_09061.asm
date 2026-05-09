; DESCRIPTION: Draws a white line from (270, 42) to (212, 174).
; PLAN: r0=270(x1), r1=42(y1), r2=212(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 42
LDI r2, 212
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
