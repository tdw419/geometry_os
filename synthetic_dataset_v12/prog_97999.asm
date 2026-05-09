; DESCRIPTION: Renders a yellow box of size 42x56 starting at (158, 169).
; PLAN: r0=158(x), r1=169(y), r2=42(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 169
LDI r2, 42
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
