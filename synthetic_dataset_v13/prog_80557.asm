; DESCRIPTION: Places a black 83x75 rectangle at position (382, 113).
; PLAN: r0=382(x), r1=113(y), r2=83(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 113
LDI r2, 83
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
