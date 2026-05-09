; DESCRIPTION: Renders a orange box of size 50x108 starting at (280, 91).
; PLAN: r0=280(x), r1=91(y), r2=50(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 91
LDI r2, 50
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
