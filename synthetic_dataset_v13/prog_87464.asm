; DESCRIPTION: Renders a red box of size 108x62 starting at (210, 175).
; PLAN: r0=210(x), r1=175(y), r2=108(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 175
LDI r2, 108
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
