; DESCRIPTION: Places a white 70x20 rectangle at position (190, 87).
; PLAN: r0=190(x), r1=87(y), r2=70(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 87
LDI r2, 70
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
