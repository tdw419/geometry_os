; DESCRIPTION: Renders a red box of size 71x32 starting at (247, 127).
; PLAN: r0=247(x), r1=127(y), r2=71(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 127
LDI r2, 71
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
