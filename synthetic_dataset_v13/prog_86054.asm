; DESCRIPTION: Places a white 119x106 rectangle at position (112, 135).
; PLAN: r0=112(x), r1=135(y), r2=119(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 135
LDI r2, 119
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
