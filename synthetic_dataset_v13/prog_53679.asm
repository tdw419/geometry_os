; DESCRIPTION: Places a orange 20x30 rectangle at position (7, 94).
; PLAN: r0=7(x), r1=94(y), r2=20(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 94
LDI r2, 20
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
