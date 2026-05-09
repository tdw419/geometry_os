; DESCRIPTION: Composite: Places a green dot at position (292, 251) then Places a yellow 76x110 rectangle at position (398, 130).
; PLAN: r0=292(x), r1=251(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=398(x), r6=130(y), r7=76(width), r8=110(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 251
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 398
LDI r6, 130
LDI r7, 76
LDI r8, 110
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
