; DESCRIPTION: Places a blue 120x13 rectangle at position (360, 209).
; PLAN: r0=360(x), r1=209(y), r2=120(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 209
LDI r2, 120
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
