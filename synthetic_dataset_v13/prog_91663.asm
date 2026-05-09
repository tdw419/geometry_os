; DESCRIPTION: Places a white 105x22 rectangle at position (213, 117).
; PLAN: r0=213(x), r1=117(y), r2=105(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 117
LDI r2, 105
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
