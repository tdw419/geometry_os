; DESCRIPTION: Composite: Places a cyan line segment connecting (275, 236) to (99, 93) then Renders a yellow disk with center (57, 122) and radius 39.
; PLAN: r0=275(x1), r1=236(y1), r2=99(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=122(y), r7=39(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 275
LDI r1, 236
LDI r2, 99
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 122
LDI r7, 39
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
