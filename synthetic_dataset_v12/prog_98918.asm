; DESCRIPTION: Renders a magenta box of size 33x76 starting at (198, 79).
; PLAN: r0=198(x), r1=79(y), r2=33(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 79
LDI r2, 33
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
