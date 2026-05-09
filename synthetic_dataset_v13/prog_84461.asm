; DESCRIPTION: Composite: Draws a cyan circle centered at (193, 52) with radius 42 then Draws a black line from (190, 11) to (210, 195).
; PLAN: r0=193(x), r1=52(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x1), r6=11(y1), r7=210(x2), r8=195(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 52
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 11
LDI r7, 210
LDI r8, 195
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
