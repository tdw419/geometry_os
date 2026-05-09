; DESCRIPTION: Places a blue 73x10 rectangle at position (75, 39).
; PLAN: r0=75(x), r1=39(y), r2=73(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 39
LDI r2, 73
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
