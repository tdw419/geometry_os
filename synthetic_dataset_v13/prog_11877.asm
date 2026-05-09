; DESCRIPTION: Places a green 97x116 rectangle at position (245, 100).
; PLAN: r0=245(x), r1=100(y), r2=97(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 100
LDI r2, 97
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
