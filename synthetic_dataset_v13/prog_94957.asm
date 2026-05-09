; DESCRIPTION: Places a white 24x49 rectangle at position (221, 140).
; PLAN: r0=221(x), r1=140(y), r2=24(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 140
LDI r2, 24
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
