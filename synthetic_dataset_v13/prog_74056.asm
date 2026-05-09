; DESCRIPTION: Renders a magenta box of size 33x36 starting at (48, 160).
; PLAN: r0=48(x), r1=160(y), r2=33(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 160
LDI r2, 33
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
