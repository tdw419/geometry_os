; DESCRIPTION: Places a white 92x12 rectangle at position (160, 126).
; PLAN: r0=160(x), r1=126(y), r2=92(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 126
LDI r2, 92
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
