; DESCRIPTION: Places a white 40x57 rectangle at position (425, 175).
; PLAN: r0=425(x), r1=175(y), r2=40(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 175
LDI r2, 40
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
