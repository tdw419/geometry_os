; DESCRIPTION: Places a yellow 16x60 rectangle at position (134, 175).
; PLAN: r0=134(x), r1=175(y), r2=16(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 175
LDI r2, 16
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
