; DESCRIPTION: Places a yellow 42x22 rectangle at position (314, 198).
; PLAN: r0=314(x), r1=198(y), r2=42(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 198
LDI r2, 42
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
