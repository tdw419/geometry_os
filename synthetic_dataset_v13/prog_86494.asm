; DESCRIPTION: Renders a red box of size 95x13 starting at (64, 125).
; PLAN: r0=64(x), r1=125(y), r2=95(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 125
LDI r2, 95
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
