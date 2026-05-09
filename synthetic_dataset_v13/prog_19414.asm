; DESCRIPTION: Places a green 28x58 rectangle at position (222, 31).
; PLAN: r0=222(x), r1=31(y), r2=28(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 31
LDI r2, 28
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
