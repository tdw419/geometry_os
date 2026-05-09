; DESCRIPTION: Places a white 78x64 rectangle at position (165, 96).
; PLAN: r0=165(x), r1=96(y), r2=78(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 96
LDI r2, 78
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
