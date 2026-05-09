; DESCRIPTION: Renders a blue box of size 63x77 starting at (260, 42).
; PLAN: r0=260(x), r1=42(y), r2=63(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 42
LDI r2, 63
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
