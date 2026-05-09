; DESCRIPTION: Composite: Renders a yellow box of size 102x97 starting at (345, 159) then Places a cyan circle of radius 28 at center (46, 145).
; PLAN: r0=345(x), r1=159(y), r2=102(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=46(x), r6=145(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 159
LDI r2, 102
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 145
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
