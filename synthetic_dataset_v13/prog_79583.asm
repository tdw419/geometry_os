; DESCRIPTION: Renders a blue box of size 52x42 starting at (42, 91).
; PLAN: r0=42(x), r1=91(y), r2=52(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 91
LDI r2, 52
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
