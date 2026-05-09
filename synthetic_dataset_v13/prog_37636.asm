; DESCRIPTION: Places a white 76x77 rectangle at position (38, 52).
; PLAN: r0=38(x), r1=52(y), r2=76(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 52
LDI r2, 76
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
