; DESCRIPTION: Places a white 70x74 rectangle at position (301, 39).
; PLAN: r0=301(x), r1=39(y), r2=70(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 39
LDI r2, 70
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
