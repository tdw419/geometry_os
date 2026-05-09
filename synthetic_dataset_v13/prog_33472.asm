; DESCRIPTION: Renders a orange box of size 32x105 starting at (394, 54).
; PLAN: r0=394(x), r1=54(y), r2=32(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 54
LDI r2, 32
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
