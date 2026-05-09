; DESCRIPTION: Places a yellow 108x42 rectangle at position (321, 66).
; PLAN: r0=321(x), r1=66(y), r2=108(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 66
LDI r2, 108
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
