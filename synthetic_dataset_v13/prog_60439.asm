; DESCRIPTION: Renders a orange box of size 22x21 starting at (103, 80).
; PLAN: r0=103(x), r1=80(y), r2=22(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 80
LDI r2, 22
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
