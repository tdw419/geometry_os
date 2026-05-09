; DESCRIPTION: Renders a red box of size 37x62 starting at (21, 59).
; PLAN: r0=21(x), r1=59(y), r2=37(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 59
LDI r2, 37
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
