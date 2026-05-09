; DESCRIPTION: Places a white 40x18 rectangle at position (342, 133).
; PLAN: r0=342(x), r1=133(y), r2=40(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 133
LDI r2, 40
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
