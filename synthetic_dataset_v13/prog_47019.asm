; DESCRIPTION: Places a green 110x33 rectangle at position (153, 135).
; PLAN: r0=153(x), r1=135(y), r2=110(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 135
LDI r2, 110
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
