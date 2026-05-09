; DESCRIPTION: Places a red 42x105 rectangle at position (254, 17).
; PLAN: r0=254(x), r1=17(y), r2=42(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 17
LDI r2, 42
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
