; DESCRIPTION: Composite: Renders a black box of size 73x117 starting at (426, 72) then Places a green dot at position (489, 192).
; PLAN: r0=426(x), r1=72(y), r2=73(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=489(x), r6=192(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 72
LDI r2, 73
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 192
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
