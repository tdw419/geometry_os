; DESCRIPTION: Places a white 104x22 rectangle at position (1, 139).
; PLAN: r0=1(x), r1=139(y), r2=104(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 139
LDI r2, 104
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
