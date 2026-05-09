; DESCRIPTION: Places a green 58x16 rectangle at position (65, 42).
; PLAN: r0=65(x), r1=42(y), r2=58(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 42
LDI r2, 58
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
