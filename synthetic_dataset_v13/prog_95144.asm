; DESCRIPTION: Renders a red box of size 67x104 starting at (172, 149).
; PLAN: r0=172(x), r1=149(y), r2=67(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 149
LDI r2, 67
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
