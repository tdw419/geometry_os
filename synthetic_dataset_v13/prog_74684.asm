; DESCRIPTION: Renders a magenta box of size 79x64 starting at (14, 33).
; PLAN: r0=14(x), r1=33(y), r2=79(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 33
LDI r2, 79
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
