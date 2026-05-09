; DESCRIPTION: Places a blue 16x38 rectangle at position (349, 212).
; PLAN: r0=349(x), r1=212(y), r2=16(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 212
LDI r2, 16
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
