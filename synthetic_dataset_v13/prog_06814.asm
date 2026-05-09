; DESCRIPTION: Places a green 42x54 rectangle at position (431, 166).
; PLAN: r0=431(x), r1=166(y), r2=42(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 166
LDI r2, 42
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
