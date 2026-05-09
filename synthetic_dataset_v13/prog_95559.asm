; DESCRIPTION: Places a cyan 118x36 rectangle at position (42, 1).
; PLAN: r0=42(x), r1=1(y), r2=118(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 1
LDI r2, 118
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
