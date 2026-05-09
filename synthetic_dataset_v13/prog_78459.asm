; DESCRIPTION: Composite: Renders a green line between points (406, 188) and (226, 247) then Places a cyan 39x110 rectangle at position (419, 69).
; PLAN: r0=406(x1), r1=188(y1), r2=226(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=69(y), r7=39(width), r8=110(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 188
LDI r2, 226
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 69
LDI r7, 39
LDI r8, 110
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
