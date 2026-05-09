; DESCRIPTION: Places a blue 24x50 rectangle at position (259, 75).
; PLAN: r0=259(x), r1=75(y), r2=24(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 75
LDI r2, 24
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
