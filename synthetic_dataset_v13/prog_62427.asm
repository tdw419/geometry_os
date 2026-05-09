; DESCRIPTION: Renders a orange box of size 58x42 starting at (412, 85).
; PLAN: r0=412(x), r1=85(y), r2=58(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 85
LDI r2, 58
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
