; DESCRIPTION: Renders a yellow box of size 42x18 starting at (110, 163).
; PLAN: r0=110(x), r1=163(y), r2=42(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 163
LDI r2, 42
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
