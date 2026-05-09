; DESCRIPTION: Composite: Places a red dot at position (510, 118) then Renders a yellow box of size 57x52 starting at (407, 79).
; PLAN: r0=510(x), r1=118(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=79(y), r7=57(width), r8=52(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 510
LDI r1, 118
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 407
LDI r6, 79
LDI r7, 57
LDI r8, 52
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
