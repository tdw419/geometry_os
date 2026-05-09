; DESCRIPTION: Composite: Draws a white line from (343, 105) to (190, 102) then Places a cyan circle of radius 45 at center (180, 50).
; PLAN: r0=343(x1), r1=105(y1), r2=190(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=50(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 343
LDI r1, 105
LDI r2, 190
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 50
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
