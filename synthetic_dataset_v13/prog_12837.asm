; DESCRIPTION: Renders a red box of size 42x34 starting at (39, 125).
; PLAN: r0=39(x), r1=125(y), r2=42(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 125
LDI r2, 42
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
