; DESCRIPTION: Renders a red box of size 119x104 starting at (281, 61).
; PLAN: r0=281(x), r1=61(y), r2=119(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 61
LDI r2, 119
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
