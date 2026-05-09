; DESCRIPTION: Places a white 90x58 rectangle at position (225, 83).
; PLAN: r0=225(x), r1=83(y), r2=90(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 83
LDI r2, 90
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
