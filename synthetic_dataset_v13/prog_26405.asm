; DESCRIPTION: Draws a green line from (75, 245) to (271, 37).
; PLAN: r0=75(x1), r1=245(y1), r2=271(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 245
LDI r2, 271
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
