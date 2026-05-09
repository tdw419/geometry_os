; DESCRIPTION: Renders a red box of size 28x18 starting at (264, 28).
; PLAN: r0=264(x), r1=28(y), r2=28(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 28
LDI r2, 28
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
