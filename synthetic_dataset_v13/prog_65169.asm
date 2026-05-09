; DESCRIPTION: Places a red 48x70 rectangle at position (176, 110).
; PLAN: r0=176(x), r1=110(y), r2=48(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 110
LDI r2, 48
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
