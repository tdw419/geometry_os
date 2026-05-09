; DESCRIPTION: Renders a cyan box of size 45x80 starting at (432, 44).
; PLAN: r0=432(x), r1=44(y), r2=45(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 44
LDI r2, 45
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
