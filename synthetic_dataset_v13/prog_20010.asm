; DESCRIPTION: Renders a orange box of size 75x66 starting at (435, 160).
; PLAN: r0=435(x), r1=160(y), r2=75(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 160
LDI r2, 75
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
