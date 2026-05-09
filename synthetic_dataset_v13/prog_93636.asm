; DESCRIPTION: Places a white 53x77 rectangle at position (305, 162).
; PLAN: r0=305(x), r1=162(y), r2=53(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 162
LDI r2, 53
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
