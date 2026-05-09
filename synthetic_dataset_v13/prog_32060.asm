; DESCRIPTION: Composite: Places a magenta dot at position (178, 143) then Places a blue line segment connecting (309, 205) to (482, 140).
; PLAN: r0=178(x), r1=143(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=309(x1), r6=205(y1), r7=482(x2), r8=140(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 143
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 205
LDI r7, 482
LDI r8, 140
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
