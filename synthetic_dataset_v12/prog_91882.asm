; DESCRIPTION: Places a green 42x21 rectangle at position (170, 230).
; PLAN: r0=170(x), r1=230(y), r2=42(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 230
LDI r2, 42
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
