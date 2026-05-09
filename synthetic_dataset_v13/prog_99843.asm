; DESCRIPTION: Places a green 15x46 rectangle at position (175, 13).
; PLAN: r0=175(x), r1=13(y), r2=15(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 13
LDI r2, 15
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
