; DESCRIPTION: Composite: Places a green line segment connecting (320, 76) to (333, 97) then Places a green dot at position (61, 166).
; PLAN: r0=320(x1), r1=76(y1), r2=333(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=166(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 76
LDI r2, 333
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 166
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
