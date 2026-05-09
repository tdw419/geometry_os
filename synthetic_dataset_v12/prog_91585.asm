; DESCRIPTION: Places a green 23x14 rectangle at position (474, 199).
; PLAN: r0=474(x), r1=199(y), r2=23(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 199
LDI r2, 23
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
