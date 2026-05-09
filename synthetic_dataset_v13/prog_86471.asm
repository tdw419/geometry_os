; DESCRIPTION: Places a green 95x110 rectangle at position (400, 98).
; PLAN: r0=400(x), r1=98(y), r2=95(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 98
LDI r2, 95
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
