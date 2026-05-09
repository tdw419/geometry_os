; DESCRIPTION: Places a green 66x105 rectangle at position (141, 46).
; PLAN: r0=141(x), r1=46(y), r2=66(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 46
LDI r2, 66
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
