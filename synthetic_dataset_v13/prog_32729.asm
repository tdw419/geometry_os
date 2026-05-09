; DESCRIPTION: Draws a cyan line from (158, 67) to (60, 203).
; PLAN: r0=158(x1), r1=67(y1), r2=60(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 67
LDI r2, 60
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
