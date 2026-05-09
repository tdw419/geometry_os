; DESCRIPTION: Places a white 35x119 rectangle at position (445, 48).
; PLAN: r0=445(x), r1=48(y), r2=35(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 48
LDI r2, 35
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
