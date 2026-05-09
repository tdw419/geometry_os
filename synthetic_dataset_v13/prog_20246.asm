; DESCRIPTION: Draws a blue line from (111, 203) to (160, 213).
; PLAN: r0=111(x1), r1=203(y1), r2=160(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 203
LDI r2, 160
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
