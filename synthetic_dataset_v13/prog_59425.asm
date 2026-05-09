; DESCRIPTION: Places a white 38x99 rectangle at position (105, 82).
; PLAN: r0=105(x), r1=82(y), r2=38(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 82
LDI r2, 38
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
