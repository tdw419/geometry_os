; DESCRIPTION: Places a green 114x77 rectangle at position (175, 179).
; PLAN: r0=175(x), r1=179(y), r2=114(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 179
LDI r2, 114
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
