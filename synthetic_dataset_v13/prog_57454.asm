; DESCRIPTION: Renders a red box of size 71x64 starting at (220, 101).
; PLAN: r0=220(x), r1=101(y), r2=71(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 101
LDI r2, 71
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
