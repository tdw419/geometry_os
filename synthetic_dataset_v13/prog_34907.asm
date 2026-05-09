; DESCRIPTION: Composite: Places a white dot at position (465, 74) then Draws a cyan line from (71, 117) to (374, 121).
; PLAN: r0=465(x), r1=74(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=71(x1), r6=117(y1), r7=374(x2), r8=121(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 465
LDI r1, 74
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 71
LDI r6, 117
LDI r7, 374
LDI r8, 121
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
