; DESCRIPTION: Places a orange 118x113 rectangle at position (274, 42).
; PLAN: r0=274(x), r1=42(y), r2=118(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 42
LDI r2, 118
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
