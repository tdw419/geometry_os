; DESCRIPTION: Renders a red box of size 59x21 starting at (113, 135).
; PLAN: r0=113(x), r1=135(y), r2=59(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 135
LDI r2, 59
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
