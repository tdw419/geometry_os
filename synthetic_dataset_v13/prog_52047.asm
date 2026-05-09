; DESCRIPTION: Places a yellow 77x20 rectangle at position (425, 5).
; PLAN: r0=425(x), r1=5(y), r2=77(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 5
LDI r2, 77
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
