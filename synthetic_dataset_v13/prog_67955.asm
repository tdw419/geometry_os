; DESCRIPTION: Renders a cyan box of size 44x69 starting at (163, 94).
; PLAN: r0=163(x), r1=94(y), r2=44(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 94
LDI r2, 44
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
