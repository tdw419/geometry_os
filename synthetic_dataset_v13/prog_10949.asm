; DESCRIPTION: Composite: Sets a single purple pixel at (92, 208) then Places a cyan line segment connecting (164, 97) to (256, 53).
; PLAN: r0=92(x), r1=208(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=164(x1), r6=97(y1), r7=256(x2), r8=53(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 208
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 164
LDI r6, 97
LDI r7, 256
LDI r8, 53
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
