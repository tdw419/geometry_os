; DESCRIPTION: Places a orange 12x42 rectangle at position (360, 113).
; PLAN: r0=360(x), r1=113(y), r2=12(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 113
LDI r2, 12
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
