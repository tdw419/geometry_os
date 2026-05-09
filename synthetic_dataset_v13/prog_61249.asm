; DESCRIPTION: Places a green 80x73 rectangle at position (320, 181).
; PLAN: r0=320(x), r1=181(y), r2=80(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 181
LDI r2, 80
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
