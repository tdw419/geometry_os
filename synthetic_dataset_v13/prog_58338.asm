; DESCRIPTION: Renders a orange box of size 59x61 starting at (231, 42).
; PLAN: r0=231(x), r1=42(y), r2=59(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 42
LDI r2, 59
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
