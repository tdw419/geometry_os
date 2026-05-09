; DESCRIPTION: Renders a red box of size 38x113 starting at (330, 49).
; PLAN: r0=330(x), r1=49(y), r2=38(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 49
LDI r2, 38
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
