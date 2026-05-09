; DESCRIPTION: Renders a green box of size 100x42 starting at (72, 121).
; PLAN: r0=72(x), r1=121(y), r2=100(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 121
LDI r2, 100
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
