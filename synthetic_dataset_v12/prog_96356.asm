; DESCRIPTION: Composite: Sets a single magenta pixel at (415, 143) then Places a cyan line segment connecting (16, 115) to (127, 170).
; PLAN: r0=415(x), r1=143(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=16(x1), r6=115(y1), r7=127(x2), r8=170(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 143
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 16
LDI r6, 115
LDI r7, 127
LDI r8, 170
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
