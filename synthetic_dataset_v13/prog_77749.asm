; DESCRIPTION: Draws a green line from (450, 68) to (441, 52).
; PLAN: r0=450(x1), r1=68(y1), r2=441(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 68
LDI r2, 441
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
