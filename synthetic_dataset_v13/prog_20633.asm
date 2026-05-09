; DESCRIPTION: Places a white 34x11 rectangle at position (274, 216).
; PLAN: r0=274(x), r1=216(y), r2=34(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 216
LDI r2, 34
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
