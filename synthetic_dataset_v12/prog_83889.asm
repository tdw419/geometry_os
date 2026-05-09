; DESCRIPTION: Places a green 100x60 rectangle at position (353, 98).
; PLAN: r0=353(x), r1=98(y), r2=100(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 98
LDI r2, 100
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
