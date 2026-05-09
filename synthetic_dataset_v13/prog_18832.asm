; DESCRIPTION: Composite: Renders a white line between points (222, 23) and (412, 39) then Places a cyan dot at position (116, 186).
; PLAN: r0=222(x1), r1=23(y1), r2=412(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=186(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 222
LDI r1, 23
LDI r2, 412
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 186
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
