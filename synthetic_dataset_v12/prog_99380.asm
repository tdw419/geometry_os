; DESCRIPTION: Places a orange 68x64 rectangle at position (58, 159).
; PLAN: r0=58(x), r1=159(y), r2=68(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 159
LDI r2, 68
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
