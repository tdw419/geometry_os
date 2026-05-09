; DESCRIPTION: Places a white 44x80 rectangle at position (139, 38).
; PLAN: r0=139(x), r1=38(y), r2=44(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 38
LDI r2, 44
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
