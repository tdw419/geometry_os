; DESCRIPTION: Renders a orange box of size 57x83 starting at (406, 130).
; PLAN: r0=406(x), r1=130(y), r2=57(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 130
LDI r2, 57
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
