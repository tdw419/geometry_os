; DESCRIPTION: Places a green 49x39 rectangle at position (456, 119).
; PLAN: r0=456(x), r1=119(y), r2=49(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 119
LDI r2, 49
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
