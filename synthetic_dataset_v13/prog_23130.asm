; DESCRIPTION: Composite: Places a cyan 45x47 rectangle at position (416, 83) then Sets a single blue pixel at (298, 193).
; PLAN: r0=416(x), r1=83(y), r2=45(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=193(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 83
LDI r2, 45
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 193
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
