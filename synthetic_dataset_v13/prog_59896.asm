; DESCRIPTION: Places a green 103x57 rectangle at position (232, 31).
; PLAN: r0=232(x), r1=31(y), r2=103(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 31
LDI r2, 103
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
