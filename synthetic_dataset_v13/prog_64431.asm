; DESCRIPTION: Composite: Renders a red line between points (346, 255) and (174, 137) then Places a blue dot at position (436, 203).
; PLAN: r0=346(x1), r1=255(y1), r2=174(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=203(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 346
LDI r1, 255
LDI r2, 174
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 203
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
