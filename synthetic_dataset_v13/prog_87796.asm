; DESCRIPTION: Composite: Renders a cyan line between points (474, 115) and (415, 170) then Places a blue dot at position (403, 133).
; PLAN: r0=474(x1), r1=115(y1), r2=415(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=133(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 474
LDI r1, 115
LDI r2, 415
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 133
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
