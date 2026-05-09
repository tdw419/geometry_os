; DESCRIPTION: Renders a yellow box of size 84x57 starting at (40, 42).
; PLAN: r0=40(x), r1=42(y), r2=84(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 42
LDI r2, 84
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
