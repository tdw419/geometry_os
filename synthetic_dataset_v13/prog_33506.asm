; DESCRIPTION: Places a magenta 42x46 rectangle at position (352, 88).
; PLAN: r0=352(x), r1=88(y), r2=42(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 88
LDI r2, 42
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
