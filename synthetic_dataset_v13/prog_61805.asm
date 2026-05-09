; DESCRIPTION: Renders a red box of size 47x74 starting at (232, 27).
; PLAN: r0=232(x), r1=27(y), r2=47(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 27
LDI r2, 47
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
