; DESCRIPTION: Places a green 22x20 rectangle at position (165, 115).
; PLAN: r0=165(x), r1=115(y), r2=22(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 115
LDI r2, 22
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
