; DESCRIPTION: Composite: Renders a cyan box of size 54x16 starting at (190, 190) then Places a black circle of radius 65 at center (437, 172).
; PLAN: r0=190(x), r1=190(y), r2=54(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x), r6=172(y), r7=65(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 190
LDI r1, 190
LDI r2, 54
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 172
LDI r7, 65
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
