; DESCRIPTION: Places a yellow 57x16 rectangle at position (12, 70).
; PLAN: r0=12(x), r1=70(y), r2=57(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 70
LDI r2, 57
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
