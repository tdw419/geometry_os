; DESCRIPTION: Places a green 88x14 rectangle at position (277, 31).
; PLAN: r0=277(x), r1=31(y), r2=88(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 31
LDI r2, 88
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
