; DESCRIPTION: Renders a orange box of size 70x42 starting at (231, 77).
; PLAN: r0=231(x), r1=77(y), r2=70(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 77
LDI r2, 70
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
