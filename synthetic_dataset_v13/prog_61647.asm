; DESCRIPTION: Composite: Places a orange dot at position (325, 20) then Places a green 35x80 rectangle at position (208, 76).
; PLAN: r0=325(x), r1=20(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=208(x), r6=76(y), r7=35(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 20
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 208
LDI r6, 76
LDI r7, 35
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
