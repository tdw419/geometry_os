; DESCRIPTION: Renders a orange box of size 95x32 starting at (54, 65).
; PLAN: r0=54(x), r1=65(y), r2=95(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 65
LDI r2, 95
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
