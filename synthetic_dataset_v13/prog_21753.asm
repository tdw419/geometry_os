; DESCRIPTION: Places a white 44x111 rectangle at position (2, 85).
; PLAN: r0=2(x), r1=85(y), r2=44(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 85
LDI r2, 44
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
