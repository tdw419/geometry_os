; DESCRIPTION: Renders a orange box of size 54x40 starting at (33, 91).
; PLAN: r0=33(x), r1=91(y), r2=54(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 91
LDI r2, 54
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
