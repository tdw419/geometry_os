; DESCRIPTION: Renders a orange box of size 99x83 starting at (290, 32).
; PLAN: r0=290(x), r1=32(y), r2=99(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 32
LDI r2, 99
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
