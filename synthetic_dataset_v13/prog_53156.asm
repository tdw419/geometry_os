; DESCRIPTION: Composite: Renders a green box of size 36x107 starting at (290, 17) then Places a yellow dot at position (220, 86).
; PLAN: r0=290(x), r1=17(y), r2=36(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=86(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 290
LDI r1, 17
LDI r2, 36
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 86
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
