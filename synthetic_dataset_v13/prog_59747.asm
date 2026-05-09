; DESCRIPTION: Renders a yellow box of size 63x30 starting at (195, 47).
; PLAN: r0=195(x), r1=47(y), r2=63(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 47
LDI r2, 63
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
