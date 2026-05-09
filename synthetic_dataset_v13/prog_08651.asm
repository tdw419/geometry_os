; DESCRIPTION: Renders a red box of size 104x78 starting at (351, 96).
; PLAN: r0=351(x), r1=96(y), r2=104(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 96
LDI r2, 104
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
