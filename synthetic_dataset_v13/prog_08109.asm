; DESCRIPTION: Renders a red box of size 16x59 starting at (171, 84).
; PLAN: r0=171(x), r1=84(y), r2=16(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 84
LDI r2, 16
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
