; DESCRIPTION: Places a white 70x98 rectangle at position (2, 141).
; PLAN: r0=2(x), r1=141(y), r2=70(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 141
LDI r2, 70
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
