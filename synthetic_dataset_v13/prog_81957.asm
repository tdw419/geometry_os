; DESCRIPTION: Renders a red box of size 10x42 starting at (247, 209).
; PLAN: r0=247(x), r1=209(y), r2=10(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 209
LDI r2, 10
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
