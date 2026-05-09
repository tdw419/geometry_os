; DESCRIPTION: Places a white 45x52 rectangle at position (148, 124).
; PLAN: r0=148(x), r1=124(y), r2=45(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 124
LDI r2, 45
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
