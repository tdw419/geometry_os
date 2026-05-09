; DESCRIPTION: Places a green 90x74 rectangle at position (226, 32).
; PLAN: r0=226(x), r1=32(y), r2=90(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 32
LDI r2, 90
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
