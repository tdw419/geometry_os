; DESCRIPTION: Composite: Places a cyan dot at position (386, 4) then Draws a black line from (121, 54) to (293, 74).
; PLAN: r0=386(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=121(x1), r6=54(y1), r7=293(x2), r8=74(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 4
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 121
LDI r6, 54
LDI r7, 293
LDI r8, 74
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
