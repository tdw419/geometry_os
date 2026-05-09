; DESCRIPTION: Renders a red box of size 106x23 starting at (283, 128).
; PLAN: r0=283(x), r1=128(y), r2=106(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 128
LDI r2, 106
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
