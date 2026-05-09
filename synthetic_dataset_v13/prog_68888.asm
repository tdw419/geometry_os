; DESCRIPTION: Renders a orange box of size 118x42 starting at (13, 86).
; PLAN: r0=13(x), r1=86(y), r2=118(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 86
LDI r2, 118
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
