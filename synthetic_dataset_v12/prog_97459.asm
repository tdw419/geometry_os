; DESCRIPTION: Places a white 44x92 rectangle at position (175, 155).
; PLAN: r0=175(x), r1=155(y), r2=44(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 155
LDI r2, 44
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
