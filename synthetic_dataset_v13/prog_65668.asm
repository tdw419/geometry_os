; DESCRIPTION: Places a white 65x116 rectangle at position (99, 48).
; PLAN: r0=99(x), r1=48(y), r2=65(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 48
LDI r2, 65
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
