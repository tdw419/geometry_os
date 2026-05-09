; DESCRIPTION: Draws a white line from (95, 254) to (228, 85).
; PLAN: r0=95(x1), r1=254(y1), r2=228(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 254
LDI r2, 228
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
