; DESCRIPTION: Draws a cyan line from (204, 86) to (203, 90).
; PLAN: r0=204(x1), r1=86(y1), r2=203(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 86
LDI r2, 203
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
