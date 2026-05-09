; DESCRIPTION: Renders a red box of size 105x18 starting at (307, 59).
; PLAN: r0=307(x), r1=59(y), r2=105(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 59
LDI r2, 105
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
