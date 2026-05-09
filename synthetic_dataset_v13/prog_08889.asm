; DESCRIPTION: Places a white 22x113 rectangle at position (197, 124).
; PLAN: r0=197(x), r1=124(y), r2=22(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 124
LDI r2, 22
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
