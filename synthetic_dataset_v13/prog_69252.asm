; DESCRIPTION: Places a white 56x70 rectangle at position (1, 74).
; PLAN: r0=1(x), r1=74(y), r2=56(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 74
LDI r2, 56
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
