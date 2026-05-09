; DESCRIPTION: Composite: Draws a red line from (103, 52) to (305, 77) then Places a green dot at position (9, 92).
; PLAN: r0=103(x1), r1=52(y1), r2=305(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=92(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 52
LDI r2, 305
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 92
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
