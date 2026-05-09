; DESCRIPTION: Renders a red box of size 10x115 starting at (60, 42).
; PLAN: r0=60(x), r1=42(y), r2=10(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 42
LDI r2, 10
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
