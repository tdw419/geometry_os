; DESCRIPTION: Renders a orange box of size 46x42 starting at (211, 178).
; PLAN: r0=211(x), r1=178(y), r2=46(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 178
LDI r2, 46
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
