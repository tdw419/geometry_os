; DESCRIPTION: Renders a orange box of size 82x16 starting at (346, 101).
; PLAN: r0=346(x), r1=101(y), r2=82(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 101
LDI r2, 82
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
