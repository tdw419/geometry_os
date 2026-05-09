; DESCRIPTION: Places a white 92x74 rectangle at position (115, 55).
; PLAN: r0=115(x), r1=55(y), r2=92(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 55
LDI r2, 92
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
