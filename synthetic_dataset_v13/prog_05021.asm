; DESCRIPTION: Composite: Places a cyan line segment connecting (7, 91) to (305, 49) then Places a green dot at position (298, 216).
; PLAN: r0=7(x1), r1=91(y1), r2=305(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=216(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 7
LDI r1, 91
LDI r2, 305
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 216
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
