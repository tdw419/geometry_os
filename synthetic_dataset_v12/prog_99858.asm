; DESCRIPTION: Places a green 10x119 rectangle at position (116, 55).
; PLAN: r0=116(x), r1=55(y), r2=10(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 55
LDI r2, 10
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
