; DESCRIPTION: Places a white 29x36 rectangle at position (161, 124).
; PLAN: r0=161(x), r1=124(y), r2=29(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 124
LDI r2, 29
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
