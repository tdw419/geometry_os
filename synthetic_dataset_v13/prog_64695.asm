; DESCRIPTION: Places a yellow 92x42 rectangle at position (203, 97).
; PLAN: r0=203(x), r1=97(y), r2=92(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 97
LDI r2, 92
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
