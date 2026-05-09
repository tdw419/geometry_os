; DESCRIPTION: Composite: Sets a single black pixel at (226, 205) then Renders a red line between points (502, 37) and (337, 152).
; PLAN: r0=226(x), r1=205(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=502(x1), r6=37(y1), r7=337(x2), r8=152(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 205
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 502
LDI r6, 37
LDI r7, 337
LDI r8, 152
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
