; DESCRIPTION: Composite: Renders a red line between points (254, 86) and (204, 224) then Places a cyan dot at position (456, 77).
; PLAN: r0=254(x1), r1=86(y1), r2=204(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=77(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 86
LDI r2, 204
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 77
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
