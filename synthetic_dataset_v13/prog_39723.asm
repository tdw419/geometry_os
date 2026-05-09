; DESCRIPTION: Places a blue 17x76 rectangle at position (333, 7).
; PLAN: r0=333(x), r1=7(y), r2=17(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 7
LDI r2, 17
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
