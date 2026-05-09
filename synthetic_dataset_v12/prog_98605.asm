; DESCRIPTION: Renders a red box of size 72x53 starting at (91, 20).
; PLAN: r0=91(x), r1=20(y), r2=72(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 20
LDI r2, 72
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
