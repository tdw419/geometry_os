; DESCRIPTION: Places a white 34x80 rectangle at position (455, 129).
; PLAN: r0=455(x), r1=129(y), r2=34(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 129
LDI r2, 34
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
