; DESCRIPTION: Draws a purple line from (291, 49) to (215, 228).
; PLAN: r0=291(x1), r1=49(y1), r2=215(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 49
LDI r2, 215
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
