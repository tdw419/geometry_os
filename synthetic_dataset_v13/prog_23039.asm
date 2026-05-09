; DESCRIPTION: Renders a red box of size 120x35 starting at (347, 95).
; PLAN: r0=347(x), r1=95(y), r2=120(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 95
LDI r2, 120
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
