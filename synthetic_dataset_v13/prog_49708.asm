; DESCRIPTION: Places a cyan 36x22 rectangle at position (300, 122).
; PLAN: r0=300(x), r1=122(y), r2=36(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 122
LDI r2, 36
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
