; DESCRIPTION: Places a green 120x110 rectangle at position (150, 104).
; PLAN: r0=150(x), r1=104(y), r2=120(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 104
LDI r2, 120
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
