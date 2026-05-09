; DESCRIPTION: Draws a purple line from (217, 42) to (125, 91).
; PLAN: r0=217(x1), r1=42(y1), r2=125(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 42
LDI r2, 125
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
