; DESCRIPTION: Composite: Places a purple 57x98 rectangle at position (305, 139) then Renders a black line between points (244, 19) and (502, 130).
; PLAN: r0=305(x), r1=139(y), r2=57(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x1), r6=19(y1), r7=502(x2), r8=130(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 139
LDI r2, 57
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 19
LDI r7, 502
LDI r8, 130
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
