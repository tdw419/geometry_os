; DESCRIPTION: Places a yellow 86x37 rectangle at position (239, 68).
; PLAN: r0=239(x), r1=68(y), r2=86(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 68
LDI r2, 86
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
