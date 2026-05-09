; DESCRIPTION: Composite: Places a black dot at position (435, 87) then Draws a cyan line from (228, 46) to (94, 167).
; PLAN: r0=435(x), r1=87(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=228(x1), r6=46(y1), r7=94(x2), r8=167(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 87
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 228
LDI r6, 46
LDI r7, 94
LDI r8, 167
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
