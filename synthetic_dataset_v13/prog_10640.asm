; DESCRIPTION: Places a white 22x71 rectangle at position (225, 161).
; PLAN: r0=225(x), r1=161(y), r2=22(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 161
LDI r2, 22
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
