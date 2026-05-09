; DESCRIPTION: Places a white 72x20 rectangle at position (286, 36).
; PLAN: r0=286(x), r1=36(y), r2=72(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 36
LDI r2, 72
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
