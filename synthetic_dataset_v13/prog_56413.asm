; DESCRIPTION: Places a green 113x31 rectangle at position (29, 104).
; PLAN: r0=29(x), r1=104(y), r2=113(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 104
LDI r2, 113
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
