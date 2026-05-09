; DESCRIPTION: Renders a yellow box of size 57x118 starting at (42, 135).
; PLAN: r0=42(x), r1=135(y), r2=57(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 135
LDI r2, 57
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
