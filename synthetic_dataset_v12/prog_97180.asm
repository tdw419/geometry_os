; DESCRIPTION: Places a white 44x77 rectangle at position (65, 135).
; PLAN: r0=65(x), r1=135(y), r2=44(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 135
LDI r2, 44
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
