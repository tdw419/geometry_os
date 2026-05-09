; DESCRIPTION: Renders a green box of size 63x27 starting at (64, 188).
; PLAN: r0=64(x), r1=188(y), r2=63(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 188
LDI r2, 63
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
