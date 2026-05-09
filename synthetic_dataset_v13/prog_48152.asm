; DESCRIPTION: Places a white 73x26 rectangle at position (391, 8).
; PLAN: r0=391(x), r1=8(y), r2=73(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 8
LDI r2, 73
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
