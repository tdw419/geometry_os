; DESCRIPTION: Places a red 58x32 rectangle at position (331, 120).
; PLAN: r0=331(x), r1=120(y), r2=58(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 120
LDI r2, 58
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
