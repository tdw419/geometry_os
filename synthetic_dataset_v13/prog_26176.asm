; DESCRIPTION: Places a green 77x20 rectangle at position (69, 6).
; PLAN: r0=69(x), r1=6(y), r2=77(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 6
LDI r2, 77
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
