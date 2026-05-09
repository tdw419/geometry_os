; DESCRIPTION: Places a white 40x106 rectangle at position (337, 25).
; PLAN: r0=337(x), r1=25(y), r2=40(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 25
LDI r2, 40
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
