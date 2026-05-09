; DESCRIPTION: Places a white 13x53 rectangle at position (286, 4).
; PLAN: r0=286(x), r1=4(y), r2=13(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 4
LDI r2, 13
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
