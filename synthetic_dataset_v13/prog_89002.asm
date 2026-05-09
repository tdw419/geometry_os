; DESCRIPTION: Draws a white line from (465, 84) to (352, 67).
; PLAN: r0=465(x1), r1=84(y1), r2=352(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 84
LDI r2, 352
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
