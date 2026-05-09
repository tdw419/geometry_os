; DESCRIPTION: Places a white 44x100 rectangle at position (441, 155).
; PLAN: r0=441(x), r1=155(y), r2=44(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 155
LDI r2, 44
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
