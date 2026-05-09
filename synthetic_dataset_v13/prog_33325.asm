; DESCRIPTION: Renders a cyan box of size 89x69 starting at (27, 49).
; PLAN: r0=27(x), r1=49(y), r2=89(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 49
LDI r2, 89
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
