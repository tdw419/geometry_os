; DESCRIPTION: Renders a red box of size 117x104 starting at (310, 50).
; PLAN: r0=310(x), r1=50(y), r2=117(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 50
LDI r2, 117
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
