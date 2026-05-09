; DESCRIPTION: Renders a red box of size 61x40 starting at (221, 105).
; PLAN: r0=221(x), r1=105(y), r2=61(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 105
LDI r2, 61
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
