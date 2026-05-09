; DESCRIPTION: Renders a orange box of size 42x59 starting at (408, 61).
; PLAN: r0=408(x), r1=61(y), r2=42(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 61
LDI r2, 42
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
