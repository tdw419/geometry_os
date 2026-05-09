; DESCRIPTION: Composite: Places a white dot at position (380, 39) then Renders a cyan disk with center (303, 117) and radius 75 then Places a magenta line segment connecting (343, 19) to (337, 226).
; PLAN: r0=380(x), r1=39(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=303(x), r6=117(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=343(x1), r11=19(y1), r12=337(x2), r13=226(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 39
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 303
LDI r6, 117
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 343
LDI r11, 19
LDI r12, 337
LDI r13, 226
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
