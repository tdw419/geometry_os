; DESCRIPTION: Renders a red box of size 53x104 starting at (342, 30).
; PLAN: r0=342(x), r1=30(y), r2=53(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 30
LDI r2, 53
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
