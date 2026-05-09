; DESCRIPTION: Places a cyan 59x106 rectangle at position (278, 42).
; PLAN: r0=278(x), r1=42(y), r2=59(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 42
LDI r2, 59
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
