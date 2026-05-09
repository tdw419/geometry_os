; DESCRIPTION: Composite: Places a cyan dot at position (498, 93) then Places a orange line segment connecting (64, 8) to (32, 146).
; PLAN: r0=498(x), r1=93(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=64(x1), r6=8(y1), r7=32(x2), r8=146(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 498
LDI r1, 93
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 64
LDI r6, 8
LDI r7, 32
LDI r8, 146
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
