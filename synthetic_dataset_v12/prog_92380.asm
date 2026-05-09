; DESCRIPTION: Places a white 28x94 rectangle at position (153, 6).
; PLAN: r0=153(x), r1=6(y), r2=28(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 6
LDI r2, 28
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
