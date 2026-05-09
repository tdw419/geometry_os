; DESCRIPTION: Places a red 93x84 rectangle at position (160, 165).
; PLAN: r0=160(x), r1=165(y), r2=93(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 165
LDI r2, 93
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
