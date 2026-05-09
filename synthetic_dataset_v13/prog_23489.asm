; DESCRIPTION: Places a green 22x111 rectangle at position (105, 18).
; PLAN: r0=105(x), r1=18(y), r2=22(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 18
LDI r2, 22
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
