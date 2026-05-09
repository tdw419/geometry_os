; DESCRIPTION: Renders a white box of size 10x22 starting at (154, 223).
; PLAN: r0=154(x), r1=223(y), r2=10(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 223
LDI r2, 10
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
