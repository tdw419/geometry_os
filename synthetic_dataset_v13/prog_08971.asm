; DESCRIPTION: Draws a green line from (48, 65) to (48, 50).
; PLAN: r0=48(x1), r1=65(y1), r2=48(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 65
LDI r2, 48
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
