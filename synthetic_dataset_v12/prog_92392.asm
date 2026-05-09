; DESCRIPTION: Draws a purple line from (67, 206) to (305, 125).
; PLAN: r0=67(x1), r1=206(y1), r2=305(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 206
LDI r2, 305
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
