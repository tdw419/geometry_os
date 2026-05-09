; DESCRIPTION: Places a white 38x70 rectangle at position (0, 183).
; PLAN: r0=0(x), r1=183(y), r2=38(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 183
LDI r2, 38
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
