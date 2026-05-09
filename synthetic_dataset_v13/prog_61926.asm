; DESCRIPTION: Places a white 22x106 rectangle at position (315, 7).
; PLAN: r0=315(x), r1=7(y), r2=22(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 7
LDI r2, 22
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
