; DESCRIPTION: Places a red 31x54 rectangle at position (32, 98).
; PLAN: r0=32(x), r1=98(y), r2=31(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 98
LDI r2, 31
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
