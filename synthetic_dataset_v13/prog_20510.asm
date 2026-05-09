; DESCRIPTION: Places a blue 119x70 rectangle at position (202, 73).
; PLAN: r0=202(x), r1=73(y), r2=119(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 73
LDI r2, 119
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
