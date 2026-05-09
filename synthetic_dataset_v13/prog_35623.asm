; DESCRIPTION: Renders a red box of size 106x115 starting at (172, 59).
; PLAN: r0=172(x), r1=59(y), r2=106(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 59
LDI r2, 106
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
