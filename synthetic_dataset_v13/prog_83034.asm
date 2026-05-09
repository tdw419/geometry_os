; DESCRIPTION: Composite: Places a red dot at position (397, 242) then Places a cyan circle of radius 60 at center (365, 159) then Draws a yellow line from (406, 130) to (445, 110).
; PLAN: r0=397(x), r1=242(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=159(y), r7=60(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=406(x1), r11=130(y1), r12=445(x2), r13=110(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 242
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 365
LDI r6, 159
LDI r7, 60
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 406
LDI r11, 130
LDI r12, 445
LDI r13, 110
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
