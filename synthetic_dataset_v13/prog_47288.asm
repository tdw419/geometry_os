; DESCRIPTION: Renders a magenta box of size 27x108 starting at (397, 65).
; PLAN: r0=397(x), r1=65(y), r2=27(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 65
LDI r2, 27
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
