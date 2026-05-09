; DESCRIPTION: Places a yellow 42x26 rectangle at position (83, 226).
; PLAN: r0=83(x), r1=226(y), r2=42(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 226
LDI r2, 42
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
