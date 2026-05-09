; DESCRIPTION: Renders a yellow box of size 92x100 starting at (150, 63).
; PLAN: r0=150(x), r1=63(y), r2=92(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 63
LDI r2, 92
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
