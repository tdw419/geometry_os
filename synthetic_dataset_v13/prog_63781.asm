; DESCRIPTION: Places a white 10x111 rectangle at position (455, 94).
; PLAN: r0=455(x), r1=94(y), r2=10(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 94
LDI r2, 10
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
