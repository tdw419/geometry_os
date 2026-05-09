; DESCRIPTION: Places a green 24x17 rectangle at position (238, 35).
; PLAN: r0=238(x), r1=35(y), r2=24(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 35
LDI r2, 24
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
