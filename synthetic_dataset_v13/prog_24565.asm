; DESCRIPTION: Renders a blue box of size 120x96 starting at (346, 42).
; PLAN: r0=346(x), r1=42(y), r2=120(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 42
LDI r2, 120
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
