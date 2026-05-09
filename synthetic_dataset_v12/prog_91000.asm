; DESCRIPTION: Renders a orange box of size 68x22 starting at (281, 10).
; PLAN: r0=281(x), r1=10(y), r2=68(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 10
LDI r2, 68
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
