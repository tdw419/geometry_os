; DESCRIPTION: Places a green 17x120 rectangle at position (259, 60).
; PLAN: r0=259(x), r1=60(y), r2=17(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 60
LDI r2, 17
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
