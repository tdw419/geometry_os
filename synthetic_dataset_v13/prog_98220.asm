; DESCRIPTION: Composite: Places a green line segment connecting (1, 249) to (20, 177) then Places a cyan dot at position (395, 166).
; PLAN: r0=1(x1), r1=249(y1), r2=20(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=166(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 1
LDI r1, 249
LDI r2, 20
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 166
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
