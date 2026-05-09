; DESCRIPTION: Composite: Places a orange dot at position (213, 248) then Places a green line segment connecting (479, 72) to (91, 255).
; PLAN: r0=213(x), r1=248(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=479(x1), r6=72(y1), r7=91(x2), r8=255(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 248
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 479
LDI r6, 72
LDI r7, 91
LDI r8, 255
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
