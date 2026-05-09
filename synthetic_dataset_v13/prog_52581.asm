; DESCRIPTION: Renders a cyan box of size 83x44 starting at (41, 39).
; PLAN: r0=41(x), r1=39(y), r2=83(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 39
LDI r2, 83
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
