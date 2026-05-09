; DESCRIPTION: Places a black 61x80 rectangle at position (4, 68).
; PLAN: r0=4(x), r1=68(y), r2=61(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 68
LDI r2, 61
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
