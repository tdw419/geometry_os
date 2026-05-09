; DESCRIPTION: Places a green 13x67 rectangle at position (27, 13).
; PLAN: r0=27(x), r1=13(y), r2=13(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 13
LDI r2, 13
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
