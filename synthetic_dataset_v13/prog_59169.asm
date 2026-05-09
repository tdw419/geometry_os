; DESCRIPTION: Places a green 17x44 rectangle at position (209, 157).
; PLAN: r0=209(x), r1=157(y), r2=17(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 157
LDI r2, 17
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
