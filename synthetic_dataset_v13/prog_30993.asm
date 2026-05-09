; DESCRIPTION: Draws a green line from (256, 67) to (65, 133).
; PLAN: r0=256(x1), r1=67(y1), r2=65(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 67
LDI r2, 65
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
