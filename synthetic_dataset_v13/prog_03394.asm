; DESCRIPTION: Places a green 25x64 rectangle at position (281, 35).
; PLAN: r0=281(x), r1=35(y), r2=25(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 35
LDI r2, 25
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
