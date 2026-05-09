; DESCRIPTION: Composite: Places a magenta dot at position (56, 81) then Places a cyan line segment connecting (110, 144) to (384, 151).
; PLAN: r0=56(x), r1=81(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=110(x1), r6=144(y1), r7=384(x2), r8=151(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 56
LDI r1, 81
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 144
LDI r7, 384
LDI r8, 151
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
