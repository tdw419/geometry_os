; DESCRIPTION: Draws a blue line from (150, 239) to (64, 71).
; PLAN: r0=150(x1), r1=239(y1), r2=64(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 239
LDI r2, 64
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
