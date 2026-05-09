; DESCRIPTION: Places a white 111x47 rectangle at position (181, 58).
; PLAN: r0=181(x), r1=58(y), r2=111(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 58
LDI r2, 111
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
