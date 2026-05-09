; DESCRIPTION: Places a green 42x117 rectangle at position (278, 71).
; PLAN: r0=278(x), r1=71(y), r2=42(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 71
LDI r2, 42
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
