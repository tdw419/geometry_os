; DESCRIPTION: Renders a red box of size 39x105 starting at (221, 49).
; PLAN: r0=221(x), r1=49(y), r2=39(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 49
LDI r2, 39
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
