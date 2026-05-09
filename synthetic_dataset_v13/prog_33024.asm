; DESCRIPTION: Places a green 54x39 rectangle at position (402, 0).
; PLAN: r0=402(x), r1=0(y), r2=54(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 0
LDI r2, 54
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
