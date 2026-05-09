; DESCRIPTION: Draws a cyan line from (381, 67) to (484, 148).
; PLAN: r0=381(x1), r1=67(y1), r2=484(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 67
LDI r2, 484
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
