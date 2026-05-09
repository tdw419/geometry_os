; DESCRIPTION: Renders a yellow box of size 42x65 starting at (329, 163).
; PLAN: r0=329(x), r1=163(y), r2=42(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 163
LDI r2, 42
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
