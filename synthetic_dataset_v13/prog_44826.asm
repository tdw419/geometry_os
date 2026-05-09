; DESCRIPTION: Renders a red box of size 61x112 starting at (174, 104).
; PLAN: r0=174(x), r1=104(y), r2=61(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 104
LDI r2, 61
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
