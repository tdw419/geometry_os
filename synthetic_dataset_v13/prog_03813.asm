; DESCRIPTION: Composite: Sets a single black pixel at (198, 210) then Draws a green line from (240, 230) to (70, 142).
; PLAN: r0=198(x), r1=210(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=240(x1), r6=230(y1), r7=70(x2), r8=142(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 210
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 240
LDI r6, 230
LDI r7, 70
LDI r8, 142
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
