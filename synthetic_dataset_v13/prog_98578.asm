; DESCRIPTION: Places a white 94x109 rectangle at position (296, 53).
; PLAN: r0=296(x), r1=53(y), r2=94(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 53
LDI r2, 94
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
