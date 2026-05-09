; DESCRIPTION: Renders a red box of size 20x16 starting at (463, 125).
; PLAN: r0=463(x), r1=125(y), r2=20(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 125
LDI r2, 20
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
