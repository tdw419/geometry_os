; DESCRIPTION: Places a white 75x26 rectangle at position (240, 124).
; PLAN: r0=240(x), r1=124(y), r2=75(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 124
LDI r2, 75
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
