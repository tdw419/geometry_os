; DESCRIPTION: Places a white 90x27 rectangle at position (381, 58).
; PLAN: r0=381(x), r1=58(y), r2=90(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 58
LDI r2, 90
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
