; DESCRIPTION: Renders a red box of size 20x116 starting at (243, 27).
; PLAN: r0=243(x), r1=27(y), r2=20(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 27
LDI r2, 20
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
