; DESCRIPTION: Renders a red box of size 10x20 starting at (285, 54).
; PLAN: r0=285(x), r1=54(y), r2=10(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 54
LDI r2, 10
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
