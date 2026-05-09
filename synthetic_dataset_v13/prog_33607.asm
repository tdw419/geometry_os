; DESCRIPTION: Renders a white box of size 48x63 starting at (274, 87).
; PLAN: r0=274(x), r1=87(y), r2=48(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 87
LDI r2, 48
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
