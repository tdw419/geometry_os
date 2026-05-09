; DESCRIPTION: Renders a orange box of size 29x110 starting at (440, 65).
; PLAN: r0=440(x), r1=65(y), r2=29(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 65
LDI r2, 29
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
