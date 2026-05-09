; DESCRIPTION: Places a blue 75x47 rectangle at position (334, 25).
; PLAN: r0=334(x), r1=25(y), r2=75(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 25
LDI r2, 75
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
