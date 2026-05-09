; DESCRIPTION: Places a green 80x11 rectangle at position (31, 197).
; PLAN: r0=31(x), r1=197(y), r2=80(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 197
LDI r2, 80
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
