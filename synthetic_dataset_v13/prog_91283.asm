; DESCRIPTION: Places a red 119x71 rectangle at position (244, 99).
; PLAN: r0=244(x), r1=99(y), r2=119(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 99
LDI r2, 119
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
