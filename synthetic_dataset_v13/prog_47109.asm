; DESCRIPTION: Places a orange 84x16 rectangle at position (398, 94).
; PLAN: r0=398(x), r1=94(y), r2=84(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 94
LDI r2, 84
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
