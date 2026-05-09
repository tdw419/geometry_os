; DESCRIPTION: Composite: Renders a black box of size 101x46 starting at (45, 80) then Sets a single cyan pixel at (384, 83).
; PLAN: r0=45(x), r1=80(y), r2=101(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=83(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 45
LDI r1, 80
LDI r2, 101
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 83
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
