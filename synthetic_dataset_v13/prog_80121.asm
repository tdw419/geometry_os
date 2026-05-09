; DESCRIPTION: Places a black 85x54 rectangle at position (175, 191).
; PLAN: r0=175(x), r1=191(y), r2=85(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 191
LDI r2, 85
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
