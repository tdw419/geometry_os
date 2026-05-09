; DESCRIPTION: Places a white 106x19 rectangle at position (29, 79).
; PLAN: r0=29(x), r1=79(y), r2=106(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 79
LDI r2, 106
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
