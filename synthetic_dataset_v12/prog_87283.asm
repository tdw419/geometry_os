; DESCRIPTION: Draws a white line from (54, 57) to (150, 71).
; PLAN: r0=54(x1), r1=57(y1), r2=150(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 57
LDI r2, 150
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
