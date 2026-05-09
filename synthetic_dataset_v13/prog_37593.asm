; DESCRIPTION: Draws a yellow line from (215, 210) to (157, 198).
; PLAN: r0=215(x1), r1=210(y1), r2=157(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 210
LDI r2, 157
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
