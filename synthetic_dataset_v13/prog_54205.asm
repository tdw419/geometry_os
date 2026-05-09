; DESCRIPTION: Renders a red box of size 15x86 starting at (465, 116).
; PLAN: r0=465(x), r1=116(y), r2=15(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 116
LDI r2, 15
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
