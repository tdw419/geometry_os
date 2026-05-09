; DESCRIPTION: Places a blue 22x61 rectangle at position (301, 30).
; PLAN: r0=301(x), r1=30(y), r2=22(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 30
LDI r2, 22
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
