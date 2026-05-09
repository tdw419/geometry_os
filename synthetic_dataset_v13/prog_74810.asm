; DESCRIPTION: Places a white 118x61 rectangle at position (213, 37).
; PLAN: r0=213(x), r1=37(y), r2=118(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 37
LDI r2, 118
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
