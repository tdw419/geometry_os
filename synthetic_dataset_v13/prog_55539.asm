; DESCRIPTION: Renders a yellow box of size 42x42 starting at (468, 52).
; PLAN: r0=468(x), r1=52(y), r2=42(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 52
LDI r2, 42
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
