; DESCRIPTION: Renders a red box of size 110x12 starting at (77, 239).
; PLAN: r0=77(x), r1=239(y), r2=110(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 239
LDI r2, 110
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
