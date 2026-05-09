; DESCRIPTION: Places a blue 31x18 rectangle at position (327, 120).
; PLAN: r0=327(x), r1=120(y), r2=31(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 120
LDI r2, 31
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
