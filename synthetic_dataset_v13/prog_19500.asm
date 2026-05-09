; DESCRIPTION: Places a blue 86x71 rectangle at position (176, 38).
; PLAN: r0=176(x), r1=38(y), r2=86(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 38
LDI r2, 86
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
