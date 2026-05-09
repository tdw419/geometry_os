; DESCRIPTION: Draws a white line from (195, 175) to (370, 42).
; PLAN: r0=195(x1), r1=175(y1), r2=370(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 175
LDI r2, 370
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
