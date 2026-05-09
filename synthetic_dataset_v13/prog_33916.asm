; DESCRIPTION: Renders a red box of size 58x58 starting at (316, 186).
; PLAN: r0=316(x), r1=186(y), r2=58(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 186
LDI r2, 58
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
