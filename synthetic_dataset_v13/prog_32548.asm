; DESCRIPTION: Places a white 25x48 rectangle at position (385, 98).
; PLAN: r0=385(x), r1=98(y), r2=25(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 98
LDI r2, 25
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
