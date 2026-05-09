; DESCRIPTION: Composite: Places a cyan circle of radius 46 at center (451, 97) then Renders a purple box of size 109x90 starting at (130, 65).
; PLAN: r0=451(x), r1=97(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x), r6=65(y), r7=109(width), r8=90(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 97
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 65
LDI r7, 109
LDI r8, 90
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
