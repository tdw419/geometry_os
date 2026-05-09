; DESCRIPTION: Renders a yellow box of size 63x57 starting at (130, 73).
; PLAN: r0=130(x), r1=73(y), r2=63(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 73
LDI r2, 63
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
