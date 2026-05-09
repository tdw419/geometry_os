; DESCRIPTION: Renders a white box of size 54x21 starting at (10, 6).
; PLAN: r0=10(x), r1=6(y), r2=54(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 6
LDI r2, 54
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
