; DESCRIPTION: Renders a green box of size 61x15 starting at (120, 53).
; PLAN: r0=120(x), r1=53(y), r2=61(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 53
LDI r2, 61
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
