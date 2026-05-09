; DESCRIPTION: Places a green 17x62 rectangle at position (350, 120).
; PLAN: r0=350(x), r1=120(y), r2=17(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 120
LDI r2, 17
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
