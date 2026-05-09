; DESCRIPTION: Renders a yellow box of size 79x112 starting at (180, 127).
; PLAN: r0=180(x), r1=127(y), r2=79(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 127
LDI r2, 79
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
