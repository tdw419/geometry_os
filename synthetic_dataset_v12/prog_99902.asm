; DESCRIPTION: Places a white 37x111 rectangle at position (341, 26).
; PLAN: r0=341(x), r1=26(y), r2=37(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 26
LDI r2, 37
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
