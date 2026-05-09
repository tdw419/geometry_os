; DESCRIPTION: Places a white 40x59 rectangle at position (456, 156).
; PLAN: r0=456(x), r1=156(y), r2=40(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 156
LDI r2, 40
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
