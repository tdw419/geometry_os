; DESCRIPTION: Places a white 96x64 rectangle at position (162, 115).
; PLAN: r0=162(x), r1=115(y), r2=96(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 115
LDI r2, 96
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
