; DESCRIPTION: Places a green 50x40 rectangle at position (128, 11).
; PLAN: r0=128(x), r1=11(y), r2=50(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 11
LDI r2, 50
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
