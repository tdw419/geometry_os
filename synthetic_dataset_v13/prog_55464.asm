; DESCRIPTION: Places a yellow 76x65 rectangle at position (138, 156).
; PLAN: r0=138(x), r1=156(y), r2=76(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 156
LDI r2, 76
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
