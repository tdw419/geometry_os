; DESCRIPTION: Composite: Places a white dot at position (143, 44) then Draws a blue line from (135, 93) to (21, 43).
; PLAN: r0=143(x), r1=44(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=135(x1), r6=93(y1), r7=21(x2), r8=43(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 44
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 135
LDI r6, 93
LDI r7, 21
LDI r8, 43
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
