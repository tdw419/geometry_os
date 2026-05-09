; DESCRIPTION: Composite: Places a magenta dot at position (504, 118) then Renders a green line between points (9, 187) and (64, 128).
; PLAN: r0=504(x), r1=118(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=9(x1), r6=187(y1), r7=64(x2), r8=128(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 504
LDI r1, 118
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 9
LDI r6, 187
LDI r7, 64
LDI r8, 128
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
