; DESCRIPTION: Places a red 42x22 rectangle at position (385, 173).
; PLAN: r0=385(x), r1=173(y), r2=42(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 173
LDI r2, 42
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
