; DESCRIPTION: Renders a white box of size 117x72 starting at (86, 30).
; PLAN: r0=86(x), r1=30(y), r2=117(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 30
LDI r2, 117
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
