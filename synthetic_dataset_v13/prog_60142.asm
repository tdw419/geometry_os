; DESCRIPTION: Places a black 42x21 rectangle at position (207, 183).
; PLAN: r0=207(x), r1=183(y), r2=42(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 183
LDI r2, 42
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
