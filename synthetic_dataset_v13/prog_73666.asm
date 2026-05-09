; DESCRIPTION: Renders a red box of size 18x47 starting at (420, 131).
; PLAN: r0=420(x), r1=131(y), r2=18(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 131
LDI r2, 18
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
