; DESCRIPTION: Renders a orange box of size 61x54 starting at (131, 154).
; PLAN: r0=131(x), r1=154(y), r2=61(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 154
LDI r2, 61
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
