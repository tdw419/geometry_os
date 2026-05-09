; DESCRIPTION: Places a yellow 96x21 rectangle at position (70, 77).
; PLAN: r0=70(x), r1=77(y), r2=96(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 77
LDI r2, 96
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
