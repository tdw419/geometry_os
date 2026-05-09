; DESCRIPTION: Composite: Places a white line segment connecting (456, 57) to (294, 146) then Renders a green disk with center (75, 221) and radius 13.
; PLAN: r0=456(x1), r1=57(y1), r2=294(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=221(y), r7=13(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 456
LDI r1, 57
LDI r2, 294
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 221
LDI r7, 13
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
