; DESCRIPTION: Places a green 13x42 rectangle at position (352, 88).
; PLAN: r0=352(x), r1=88(y), r2=13(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 88
LDI r2, 13
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
