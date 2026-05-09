; DESCRIPTION: Places a white 55x98 rectangle at position (106, 78).
; PLAN: r0=106(x), r1=78(y), r2=55(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 78
LDI r2, 55
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
