; DESCRIPTION: Places a green 17x40 rectangle at position (74, 152).
; PLAN: r0=74(x), r1=152(y), r2=17(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 152
LDI r2, 17
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
