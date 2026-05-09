; DESCRIPTION: Places a white 15x111 rectangle at position (140, 61).
; PLAN: r0=140(x), r1=61(y), r2=15(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 61
LDI r2, 15
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
