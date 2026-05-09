; DESCRIPTION: Places a orange 42x117 rectangle at position (45, 0).
; PLAN: r0=45(x), r1=0(y), r2=42(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 0
LDI r2, 42
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
