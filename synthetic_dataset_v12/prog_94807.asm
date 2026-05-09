; DESCRIPTION: Renders a red box of size 106x33 starting at (113, 189).
; PLAN: r0=113(x), r1=189(y), r2=106(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 189
LDI r2, 106
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
