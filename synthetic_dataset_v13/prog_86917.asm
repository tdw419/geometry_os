; DESCRIPTION: Places a white 62x16 rectangle at position (323, 233).
; PLAN: r0=323(x), r1=233(y), r2=62(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 233
LDI r2, 62
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
