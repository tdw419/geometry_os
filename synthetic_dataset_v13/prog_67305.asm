; DESCRIPTION: Composite: Draws a white line from (264, 95) to (180, 149) then Sets a single green pixel at (464, 228).
; PLAN: r0=264(x1), r1=95(y1), r2=180(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=228(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 95
LDI r2, 180
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 228
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
