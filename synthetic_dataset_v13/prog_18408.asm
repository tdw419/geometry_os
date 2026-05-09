; DESCRIPTION: Places a green 119x50 rectangle at position (100, 163).
; PLAN: r0=100(x), r1=163(y), r2=119(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 163
LDI r2, 119
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
