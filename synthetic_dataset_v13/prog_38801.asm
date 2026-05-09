; DESCRIPTION: Places a white 72x77 rectangle at position (317, 69).
; PLAN: r0=317(x), r1=69(y), r2=72(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 69
LDI r2, 72
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
