; DESCRIPTION: Draws a white line from (9, 55) to (141, 228).
; PLAN: r0=9(x1), r1=55(y1), r2=141(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 55
LDI r2, 141
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
