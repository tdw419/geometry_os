; DESCRIPTION: Draws a white line from (87, 194) to (50, 59).
; PLAN: r0=87(x1), r1=194(y1), r2=50(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 194
LDI r2, 50
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
