; DESCRIPTION: Renders a blue box of size 20x42 starting at (247, 186).
; PLAN: r0=247(x), r1=186(y), r2=20(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 186
LDI r2, 20
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
