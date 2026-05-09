; DESCRIPTION: Places a black 65x107 rectangle at position (42, 36).
; PLAN: r0=42(x), r1=36(y), r2=65(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 36
LDI r2, 65
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
