; DESCRIPTION: Places a white 29x77 rectangle at position (40, 14).
; PLAN: r0=40(x), r1=14(y), r2=29(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 14
LDI r2, 29
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
