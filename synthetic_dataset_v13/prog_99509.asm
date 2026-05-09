; DESCRIPTION: Places a blue 61x24 rectangle at position (193, 215).
; PLAN: r0=193(x), r1=215(y), r2=61(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 215
LDI r2, 61
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
