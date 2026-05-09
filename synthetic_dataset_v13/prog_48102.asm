; DESCRIPTION: Places a blue 19x52 rectangle at position (480, 50).
; PLAN: r0=480(x), r1=50(y), r2=19(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 50
LDI r2, 19
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
