; DESCRIPTION: Renders a orange box of size 13x42 starting at (137, 171).
; PLAN: r0=137(x), r1=171(y), r2=13(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 171
LDI r2, 13
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
