; DESCRIPTION: Places a blue 120x16 rectangle at position (383, 164).
; PLAN: r0=383(x), r1=164(y), r2=120(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 164
LDI r2, 120
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
