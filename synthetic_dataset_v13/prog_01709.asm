; DESCRIPTION: Composite: Renders a magenta disk with center (320, 87) and radius 71 then Places a white line segment connecting (28, 82) to (317, 49) then Places a magenta dot at position (175, 46).
; PLAN: r0=320(x), r1=87(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x1), r6=82(y1), r7=317(x2), r8=49(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=175(x), r11=46(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 320
LDI r1, 87
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 82
LDI r7, 317
LDI r8, 49
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 46
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
