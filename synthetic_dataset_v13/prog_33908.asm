; DESCRIPTION: Renders a yellow box of size 64x61 starting at (353, 10).
; PLAN: r0=353(x), r1=10(y), r2=64(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 10
LDI r2, 64
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
