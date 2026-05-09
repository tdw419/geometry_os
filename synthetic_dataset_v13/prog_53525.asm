; DESCRIPTION: Renders a magenta box of size 48x62 starting at (407, 193).
; PLAN: r0=407(x), r1=193(y), r2=48(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 193
LDI r2, 48
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
