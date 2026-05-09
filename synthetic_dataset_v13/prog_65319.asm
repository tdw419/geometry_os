; DESCRIPTION: Composite: Places a cyan 55x80 rectangle at position (229, 137) then Sets a single white pixel at (489, 3).
; PLAN: r0=229(x), r1=137(y), r2=55(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=489(x), r6=3(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 137
LDI r2, 55
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 3
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
