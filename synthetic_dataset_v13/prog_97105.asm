; DESCRIPTION: Renders a red box of size 35x93 starting at (165, 92).
; PLAN: r0=165(x), r1=92(y), r2=35(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 92
LDI r2, 35
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
