; DESCRIPTION: Draws a green line from (30, 66) to (442, 173).
; PLAN: r0=30(x1), r1=66(y1), r2=442(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 66
LDI r2, 442
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
