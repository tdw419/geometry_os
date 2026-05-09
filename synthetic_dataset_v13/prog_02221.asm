; DESCRIPTION: Composite: Places a green circle of radius 48 at center (398, 205) then Renders a cyan line between points (434, 141) and (186, 42).
; PLAN: r0=398(x), r1=205(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x1), r6=141(y1), r7=186(x2), r8=42(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 205
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 141
LDI r7, 186
LDI r8, 42
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
