; DESCRIPTION: Places a green 119x47 rectangle at position (173, 94).
; PLAN: r0=173(x), r1=94(y), r2=119(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 94
LDI r2, 119
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
