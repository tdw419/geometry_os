; DESCRIPTION: Places a white 49x100 rectangle at position (186, 84).
; PLAN: r0=186(x), r1=84(y), r2=49(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 84
LDI r2, 49
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
