; DESCRIPTION: Renders a yellow box of size 43x63 starting at (455, 134).
; PLAN: r0=455(x), r1=134(y), r2=43(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 134
LDI r2, 43
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
