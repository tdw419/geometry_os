; DESCRIPTION: Renders a red box of size 12x85 starting at (123, 103).
; PLAN: r0=123(x), r1=103(y), r2=12(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 103
LDI r2, 12
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
