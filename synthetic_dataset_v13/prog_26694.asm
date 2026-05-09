; DESCRIPTION: Composite: Places a blue dot at position (3, 243) then Places a blue line segment connecting (305, 37) to (251, 242).
; PLAN: r0=3(x), r1=243(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=305(x1), r6=37(y1), r7=251(x2), r8=242(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 243
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 37
LDI r7, 251
LDI r8, 242
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
