; DESCRIPTION: Composite: Places a magenta line segment connecting (480, 95) to (165, 30) then Places a cyan circle of radius 35 at center (181, 80) then Places a red dot at position (356, 120).
; PLAN: r0=480(x1), r1=95(y1), r2=165(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=80(y), r7=35(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=356(x), r11=120(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 480
LDI r1, 95
LDI r2, 165
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 80
LDI r7, 35
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 356
LDI r11, 120
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
