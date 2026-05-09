; DESCRIPTION: Places a green 16x45 rectangle at position (333, 4).
; PLAN: r0=333(x), r1=4(y), r2=16(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 4
LDI r2, 16
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
