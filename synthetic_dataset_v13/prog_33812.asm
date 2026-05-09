; DESCRIPTION: Renders a black box of size 63x80 starting at (214, 20).
; PLAN: r0=214(x), r1=20(y), r2=63(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 20
LDI r2, 63
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
