; DESCRIPTION: Renders a red box of size 104x112 starting at (5, 11).
; PLAN: r0=5(x), r1=11(y), r2=104(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 11
LDI r2, 104
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
