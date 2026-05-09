; DESCRIPTION: Places a white 92x39 rectangle at position (4, 33).
; PLAN: r0=4(x), r1=33(y), r2=92(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 33
LDI r2, 92
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
