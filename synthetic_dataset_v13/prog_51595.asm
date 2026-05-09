; DESCRIPTION: Renders a cyan box of size 21x10 starting at (140, 170).
; PLAN: r0=140(x), r1=170(y), r2=21(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 170
LDI r2, 21
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
