; DESCRIPTION: Renders a red box of size 57x105 starting at (428, 53).
; PLAN: r0=428(x), r1=53(y), r2=57(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 53
LDI r2, 57
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
