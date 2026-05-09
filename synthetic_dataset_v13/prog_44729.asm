; DESCRIPTION: Places a green 80x115 rectangle at position (315, 3).
; PLAN: r0=315(x), r1=3(y), r2=80(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 3
LDI r2, 80
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
