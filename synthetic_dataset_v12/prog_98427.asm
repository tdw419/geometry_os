; DESCRIPTION: Renders a red box of size 61x33 starting at (81, 94).
; PLAN: r0=81(x), r1=94(y), r2=61(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 94
LDI r2, 61
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
