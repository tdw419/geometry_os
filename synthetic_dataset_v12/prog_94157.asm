; DESCRIPTION: Places a yellow 69x42 rectangle at position (4, 203).
; PLAN: r0=4(x), r1=203(y), r2=69(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 203
LDI r2, 69
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
