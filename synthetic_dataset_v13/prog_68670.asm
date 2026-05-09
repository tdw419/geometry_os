; DESCRIPTION: Places a white 92x34 rectangle at position (37, 142).
; PLAN: r0=37(x), r1=142(y), r2=92(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 142
LDI r2, 92
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
