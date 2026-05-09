; DESCRIPTION: Places a white 113x44 rectangle at position (84, 187).
; PLAN: r0=84(x), r1=187(y), r2=113(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 187
LDI r2, 113
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
