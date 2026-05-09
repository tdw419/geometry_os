; DESCRIPTION: Renders a red box of size 63x18 starting at (130, 28).
; PLAN: r0=130(x), r1=28(y), r2=63(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 28
LDI r2, 63
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
