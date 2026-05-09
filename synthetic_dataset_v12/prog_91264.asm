; DESCRIPTION: Composite: Renders a red line between points (130, 68) and (170, 108) then Places a white dot at position (415, 198).
; PLAN: r0=130(x1), r1=68(y1), r2=170(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=198(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 68
LDI r2, 170
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 198
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
