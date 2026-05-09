; DESCRIPTION: Places a white 30x109 rectangle at position (376, 24).
; PLAN: r0=376(x), r1=24(y), r2=30(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 24
LDI r2, 30
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
