; DESCRIPTION: Draws a blue line from (173, 215) to (213, 67).
; PLAN: r0=173(x1), r1=215(y1), r2=213(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 215
LDI r2, 213
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
