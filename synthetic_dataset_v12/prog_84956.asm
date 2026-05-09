; DESCRIPTION: Renders a orange box of size 115x100 starting at (263, 42).
; PLAN: r0=263(x), r1=42(y), r2=115(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 42
LDI r2, 115
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
