; DESCRIPTION: Composite: Sets a single white pixel at (233, 54) then Renders a orange line between points (394, 120) and (480, 21).
; PLAN: r0=233(x), r1=54(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=394(x1), r6=120(y1), r7=480(x2), r8=21(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 54
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 394
LDI r6, 120
LDI r7, 480
LDI r8, 21
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
