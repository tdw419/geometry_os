; DESCRIPTION: Places a blue 44x47 rectangle at position (249, 77).
; PLAN: r0=249(x), r1=77(y), r2=44(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 77
LDI r2, 44
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
