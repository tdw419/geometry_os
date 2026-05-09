; DESCRIPTION: Renders a red box of size 67x99 starting at (396, 16).
; PLAN: r0=396(x), r1=16(y), r2=67(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 16
LDI r2, 67
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
