; DESCRIPTION: Renders a yellow box of size 95x120 starting at (316, 54).
; PLAN: r0=316(x), r1=54(y), r2=95(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 54
LDI r2, 95
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
