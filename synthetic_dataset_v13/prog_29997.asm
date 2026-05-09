; DESCRIPTION: Renders a magenta box of size 65x62 starting at (180, 163).
; PLAN: r0=180(x), r1=163(y), r2=65(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 163
LDI r2, 65
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
