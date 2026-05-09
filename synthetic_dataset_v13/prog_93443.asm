; DESCRIPTION: Renders a yellow box of size 28x54 starting at (269, 73).
; PLAN: r0=269(x), r1=73(y), r2=28(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 73
LDI r2, 28
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
