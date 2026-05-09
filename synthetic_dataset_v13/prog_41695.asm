; DESCRIPTION: Places a white 94x111 rectangle at position (28, 35).
; PLAN: r0=28(x), r1=35(y), r2=94(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 35
LDI r2, 94
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
