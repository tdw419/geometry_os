; DESCRIPTION: Draws a purple line from (215, 196) to (234, 68).
; PLAN: r0=215(x1), r1=196(y1), r2=234(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 196
LDI r2, 234
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
