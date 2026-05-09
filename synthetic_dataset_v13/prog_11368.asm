; DESCRIPTION: Composite: Sets a single purple pixel at (1, 10) then Renders a black box of size 67x21 starting at (62, 99).
; PLAN: r0=1(x), r1=10(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=62(x), r6=99(y), r7=67(width), r8=21(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 10
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 62
LDI r6, 99
LDI r7, 67
LDI r8, 21
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
