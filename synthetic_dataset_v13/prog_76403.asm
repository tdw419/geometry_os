; DESCRIPTION: Renders a magenta box of size 65x10 starting at (180, 34).
; PLAN: r0=180(x), r1=34(y), r2=65(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 34
LDI r2, 65
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
