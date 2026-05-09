; DESCRIPTION: Composite: Places a cyan circle of radius 39 at center (243, 138) then Places a orange line segment connecting (263, 163) to (382, 142).
; PLAN: r0=243(x), r1=138(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x1), r6=163(y1), r7=382(x2), r8=142(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 138
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 163
LDI r7, 382
LDI r8, 142
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
