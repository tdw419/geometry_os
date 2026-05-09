; DESCRIPTION: Places a red 42x83 rectangle at position (170, 2).
; PLAN: r0=170(x), r1=2(y), r2=42(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 2
LDI r2, 42
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
