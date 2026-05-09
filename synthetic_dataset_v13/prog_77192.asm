; DESCRIPTION: Places a green 55x94 rectangle at position (380, 114).
; PLAN: r0=380(x), r1=114(y), r2=55(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 114
LDI r2, 55
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
