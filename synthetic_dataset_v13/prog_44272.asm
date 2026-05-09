; DESCRIPTION: Renders a white box of size 61x24 starting at (123, 167).
; PLAN: r0=123(x), r1=167(y), r2=61(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 167
LDI r2, 61
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
