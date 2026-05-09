; DESCRIPTION: Renders a red box of size 59x44 starting at (13, 131).
; PLAN: r0=13(x), r1=131(y), r2=59(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 131
LDI r2, 59
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
