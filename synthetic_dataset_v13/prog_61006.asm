; DESCRIPTION: Draws a cyan line from (450, 232) to (419, 68).
; PLAN: r0=450(x1), r1=232(y1), r2=419(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 232
LDI r2, 419
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
