; DESCRIPTION: Renders a red box of size 23x64 starting at (24, 179).
; PLAN: r0=24(x), r1=179(y), r2=23(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 179
LDI r2, 23
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
