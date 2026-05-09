; DESCRIPTION: Places a red 42x36 rectangle at position (104, 206).
; PLAN: r0=104(x), r1=206(y), r2=42(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 206
LDI r2, 42
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
