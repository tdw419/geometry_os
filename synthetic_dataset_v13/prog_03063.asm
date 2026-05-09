; DESCRIPTION: Renders a red box of size 56x13 starting at (226, 209).
; PLAN: r0=226(x), r1=209(y), r2=56(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 209
LDI r2, 56
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
