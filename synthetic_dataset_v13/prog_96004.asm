; DESCRIPTION: Composite: Places a red circle of radius 23 at center (91, 39) then Places a green dot at position (382, 182) then Renders a cyan line between points (409, 15) and (450, 25).
; PLAN: r0=91(x), r1=39(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=182(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=409(x1), r11=15(y1), r12=450(x2), r13=25(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 39
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 182
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 409
LDI r11, 15
LDI r12, 450
LDI r13, 25
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
