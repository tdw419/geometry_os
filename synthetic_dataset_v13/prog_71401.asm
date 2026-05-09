; DESCRIPTION: Places a white 119x99 rectangle at position (148, 133).
; PLAN: r0=148(x), r1=133(y), r2=119(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 133
LDI r2, 119
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
