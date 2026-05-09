; DESCRIPTION: Places a white 34x33 rectangle at position (445, 134).
; PLAN: r0=445(x), r1=134(y), r2=34(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 134
LDI r2, 34
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
