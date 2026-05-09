; DESCRIPTION: Places a white 47x117 rectangle at position (302, 53).
; PLAN: r0=302(x), r1=53(y), r2=47(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 53
LDI r2, 47
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
