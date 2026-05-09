; DESCRIPTION: Places a white 115x60 rectangle at position (33, 46).
; PLAN: r0=33(x), r1=46(y), r2=115(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 46
LDI r2, 115
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
