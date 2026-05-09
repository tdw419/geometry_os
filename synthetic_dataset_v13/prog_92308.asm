; DESCRIPTION: Places a white 69x89 rectangle at position (266, 92).
; PLAN: r0=266(x), r1=92(y), r2=69(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 92
LDI r2, 69
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
