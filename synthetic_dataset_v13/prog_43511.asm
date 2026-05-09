; DESCRIPTION: Renders a red box of size 113x92 starting at (320, 149).
; PLAN: r0=320(x), r1=149(y), r2=113(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 149
LDI r2, 113
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
