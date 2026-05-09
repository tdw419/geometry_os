; DESCRIPTION: Places a orange 113x42 rectangle at position (345, 153).
; PLAN: r0=345(x), r1=153(y), r2=113(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 153
LDI r2, 113
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
