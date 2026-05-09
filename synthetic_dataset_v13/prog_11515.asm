; DESCRIPTION: Places a white 24x81 rectangle at position (453, 15).
; PLAN: r0=453(x), r1=15(y), r2=24(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 15
LDI r2, 24
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
