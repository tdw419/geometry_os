; DESCRIPTION: Places a red 78x20 rectangle at position (371, 184).
; PLAN: r0=371(x), r1=184(y), r2=78(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 184
LDI r2, 78
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
