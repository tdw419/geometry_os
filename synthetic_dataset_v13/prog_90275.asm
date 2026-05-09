; DESCRIPTION: Renders a red box of size 63x86 starting at (89, 129).
; PLAN: r0=89(x), r1=129(y), r2=63(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 129
LDI r2, 63
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
