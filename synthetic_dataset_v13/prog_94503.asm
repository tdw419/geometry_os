; DESCRIPTION: Composite: Renders a green line between points (357, 97) and (265, 238) then Renders a cyan disk with center (364, 133) and radius 61.
; PLAN: r0=357(x1), r1=97(y1), r2=265(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=133(y), r7=61(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 357
LDI r1, 97
LDI r2, 265
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 133
LDI r7, 61
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
