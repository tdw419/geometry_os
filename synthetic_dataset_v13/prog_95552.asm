; DESCRIPTION: Places a white 23x102 rectangle at position (111, 135).
; PLAN: r0=111(x), r1=135(y), r2=23(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 135
LDI r2, 23
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
