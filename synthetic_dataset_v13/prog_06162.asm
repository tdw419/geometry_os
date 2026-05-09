; DESCRIPTION: Composite: Places a cyan line segment connecting (439, 81) to (220, 161) then Places a white circle of radius 24 at center (72, 53).
; PLAN: r0=439(x1), r1=81(y1), r2=220(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=53(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 81
LDI r2, 220
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 53
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
