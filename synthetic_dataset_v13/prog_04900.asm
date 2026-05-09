; DESCRIPTION: Renders a green box of size 63x48 starting at (249, 69).
; PLAN: r0=249(x), r1=69(y), r2=63(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 69
LDI r2, 63
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
