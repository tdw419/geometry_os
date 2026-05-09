; DESCRIPTION: Composite: Sets a single cyan pixel at (249, 93) then Places a red line segment connecting (111, 146) to (320, 222).
; PLAN: r0=249(x), r1=93(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=111(x1), r6=146(y1), r7=320(x2), r8=222(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 93
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 111
LDI r6, 146
LDI r7, 320
LDI r8, 222
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
