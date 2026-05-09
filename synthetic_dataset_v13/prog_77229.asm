; DESCRIPTION: Places a green 66x35 rectangle at position (175, 191).
; PLAN: r0=175(x), r1=191(y), r2=66(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 191
LDI r2, 66
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
