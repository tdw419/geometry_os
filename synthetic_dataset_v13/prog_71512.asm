; DESCRIPTION: Places a black 83x61 rectangle at position (305, 30).
; PLAN: r0=305(x), r1=30(y), r2=83(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 30
LDI r2, 83
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
