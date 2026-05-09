; DESCRIPTION: Places a white 35x66 rectangle at position (178, 177).
; PLAN: r0=178(x), r1=177(y), r2=35(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 177
LDI r2, 35
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
