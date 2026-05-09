; DESCRIPTION: Places a cyan 23x112 rectangle at position (416, 56).
; PLAN: r0=416(x), r1=56(y), r2=23(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 56
LDI r2, 23
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
