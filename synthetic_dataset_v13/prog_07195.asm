; DESCRIPTION: Composite: Renders a red line between points (39, 214) and (466, 135) then Places a white dot at position (355, 236).
; PLAN: r0=39(x1), r1=214(y1), r2=466(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=236(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 39
LDI r1, 214
LDI r2, 466
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 236
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
