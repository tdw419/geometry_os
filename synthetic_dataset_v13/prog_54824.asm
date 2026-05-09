; DESCRIPTION: Composite: Renders a cyan disk with center (226, 68) and radius 49 then Draws a cyan line from (255, 142) to (115, 61).
; PLAN: r0=226(x), r1=68(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x1), r6=142(y1), r7=115(x2), r8=61(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 68
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 142
LDI r7, 115
LDI r8, 61
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
