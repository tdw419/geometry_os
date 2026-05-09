; DESCRIPTION: Places a green 46x33 rectangle at position (55, 57).
; PLAN: r0=55(x), r1=57(y), r2=46(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 57
LDI r2, 46
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
