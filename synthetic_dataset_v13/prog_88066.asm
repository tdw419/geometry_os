; DESCRIPTION: Places a black 16x116 rectangle at position (357, 65).
; PLAN: r0=357(x), r1=65(y), r2=16(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 65
LDI r2, 16
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
