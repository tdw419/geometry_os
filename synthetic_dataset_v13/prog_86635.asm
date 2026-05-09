; DESCRIPTION: Places a cyan 117x110 rectangle at position (209, 30).
; PLAN: r0=209(x), r1=30(y), r2=117(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 30
LDI r2, 117
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
