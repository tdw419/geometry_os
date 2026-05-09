; DESCRIPTION: Places a green 77x116 rectangle at position (360, 76).
; PLAN: r0=360(x), r1=76(y), r2=77(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 76
LDI r2, 77
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
