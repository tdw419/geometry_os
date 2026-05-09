; DESCRIPTION: Places a white 73x75 rectangle at position (236, 92).
; PLAN: r0=236(x), r1=92(y), r2=73(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 92
LDI r2, 73
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
