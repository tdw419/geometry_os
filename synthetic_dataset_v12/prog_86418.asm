; DESCRIPTION: Composite: Sets a single black pixel at (284, 39) then Draws a cyan line from (158, 180) to (298, 93).
; PLAN: r0=284(x), r1=39(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=158(x1), r6=180(y1), r7=298(x2), r8=93(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 39
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 158
LDI r6, 180
LDI r7, 298
LDI r8, 93
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
