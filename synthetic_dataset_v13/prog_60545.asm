; DESCRIPTION: Composite: Places a purple dot at position (243, 44) then Renders a black box of size 117x63 starting at (345, 2).
; PLAN: r0=243(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=2(y), r7=117(width), r8=63(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 2
LDI r7, 117
LDI r8, 63
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
