; DESCRIPTION: Places a green 19x50 rectangle at position (196, 130).
; PLAN: r0=196(x), r1=130(y), r2=19(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 130
LDI r2, 19
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
