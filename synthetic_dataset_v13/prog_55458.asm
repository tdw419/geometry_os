; DESCRIPTION: Renders a red box of size 18x49 starting at (489, 59).
; PLAN: r0=489(x), r1=59(y), r2=18(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 59
LDI r2, 18
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
