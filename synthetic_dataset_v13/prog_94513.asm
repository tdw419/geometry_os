; DESCRIPTION: Draws a cyan line from (203, 29) to (200, 3).
; PLAN: r0=203(x1), r1=29(y1), r2=200(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 29
LDI r2, 200
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
