; DESCRIPTION: Places a white 109x99 rectangle at position (185, 96).
; PLAN: r0=185(x), r1=96(y), r2=109(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 96
LDI r2, 109
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
