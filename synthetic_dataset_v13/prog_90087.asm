; DESCRIPTION: Places a white 21x93 rectangle at position (453, 34).
; PLAN: r0=453(x), r1=34(y), r2=21(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 34
LDI r2, 21
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
