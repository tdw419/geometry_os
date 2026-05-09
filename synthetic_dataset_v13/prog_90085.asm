; DESCRIPTION: Draws a blue line from (271, 243) to (397, 134).
; PLAN: r0=271(x1), r1=243(y1), r2=397(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 243
LDI r2, 397
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
