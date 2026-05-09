; DESCRIPTION: Places a white 102x62 rectangle at position (280, 77).
; PLAN: r0=280(x), r1=77(y), r2=102(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 77
LDI r2, 102
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
