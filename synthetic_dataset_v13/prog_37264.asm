; DESCRIPTION: Places a green 49x25 rectangle at position (175, 22).
; PLAN: r0=175(x), r1=22(y), r2=49(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 22
LDI r2, 49
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
