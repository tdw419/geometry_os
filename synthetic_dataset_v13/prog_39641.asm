; DESCRIPTION: Composite: Places a yellow 89x25 rectangle at position (273, 110) then Sets a single cyan pixel at (357, 186).
; PLAN: r0=273(x), r1=110(y), r2=89(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=186(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 110
LDI r2, 89
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 186
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
