; DESCRIPTION: Places a green 116x87 rectangle at position (315, 76).
; PLAN: r0=315(x), r1=76(y), r2=116(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 76
LDI r2, 116
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
