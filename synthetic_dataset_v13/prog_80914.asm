; DESCRIPTION: Composite: Places a white line segment connecting (223, 243) to (81, 242) then Places a cyan dot at position (227, 240).
; PLAN: r0=223(x1), r1=243(y1), r2=81(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=240(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 243
LDI r2, 81
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 240
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
