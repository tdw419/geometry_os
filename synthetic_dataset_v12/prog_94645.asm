; DESCRIPTION: Places a green 78x83 rectangle at position (173, 65).
; PLAN: r0=173(x), r1=65(y), r2=78(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 65
LDI r2, 78
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
