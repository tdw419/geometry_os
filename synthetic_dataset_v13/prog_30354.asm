; DESCRIPTION: Renders a cyan box of size 44x89 starting at (107, 22).
; PLAN: r0=107(x), r1=22(y), r2=44(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 22
LDI r2, 44
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
