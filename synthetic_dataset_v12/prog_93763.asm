; DESCRIPTION: Draws a white line from (50, 150) to (190, 204).
; PLAN: r0=50(x1), r1=150(y1), r2=190(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 150
LDI r2, 190
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
