; DESCRIPTION: Renders a magenta box of size 84x33 starting at (215, 70).
; PLAN: r0=215(x), r1=70(y), r2=84(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 70
LDI r2, 84
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
