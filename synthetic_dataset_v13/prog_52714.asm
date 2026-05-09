; DESCRIPTION: Places a green 70x80 rectangle at position (200, 7).
; PLAN: r0=200(x), r1=7(y), r2=70(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 7
LDI r2, 70
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
