; DESCRIPTION: Places a white 112x120 rectangle at position (205, 25).
; PLAN: r0=205(x), r1=25(y), r2=112(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 25
LDI r2, 112
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
