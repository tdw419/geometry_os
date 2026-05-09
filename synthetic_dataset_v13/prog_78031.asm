; DESCRIPTION: Places a green 44x101 rectangle at position (320, 141).
; PLAN: r0=320(x), r1=141(y), r2=44(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 141
LDI r2, 44
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
