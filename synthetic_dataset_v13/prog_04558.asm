; DESCRIPTION: Places a white 57x46 rectangle at position (87, 53).
; PLAN: r0=87(x), r1=53(y), r2=57(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 53
LDI r2, 57
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
