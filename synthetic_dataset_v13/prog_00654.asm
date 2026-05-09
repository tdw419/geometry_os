; DESCRIPTION: Renders a blue box of size 48x48 starting at (294, 63).
; PLAN: r0=294(x), r1=63(y), r2=48(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 63
LDI r2, 48
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
