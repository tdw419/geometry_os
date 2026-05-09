; DESCRIPTION: Renders a white box of size 101x43 starting at (154, 190).
; PLAN: r0=154(x), r1=190(y), r2=101(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 190
LDI r2, 101
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
