; DESCRIPTION: Renders a yellow box of size 42x64 starting at (36, 58).
; PLAN: r0=36(x), r1=58(y), r2=42(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 58
LDI r2, 42
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
