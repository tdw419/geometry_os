; DESCRIPTION: Places a white 70x31 rectangle at position (24, 213).
; PLAN: r0=24(x), r1=213(y), r2=70(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 213
LDI r2, 70
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
