; DESCRIPTION: Draws a blue line from (64, 165) to (370, 213).
; PLAN: r0=64(x1), r1=165(y1), r2=370(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 165
LDI r2, 370
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
