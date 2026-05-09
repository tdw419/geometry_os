; DESCRIPTION: Renders a red box of size 59x112 starting at (55, 82).
; PLAN: r0=55(x), r1=82(y), r2=59(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 82
LDI r2, 59
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
