; DESCRIPTION: Places a green 80x116 rectangle at position (406, 76).
; PLAN: r0=406(x), r1=76(y), r2=80(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 76
LDI r2, 80
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
