; DESCRIPTION: Renders a white box of size 30x49 starting at (208, 54).
; PLAN: r0=208(x), r1=54(y), r2=30(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 54
LDI r2, 30
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
