; DESCRIPTION: Composite: Renders a cyan line between points (128, 1) and (440, 129) then Renders a white disk with center (375, 210) and radius 12 then Sets a single purple pixel at (293, 204).
; PLAN: r0=128(x1), r1=1(y1), r2=440(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=210(y), r7=12(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=293(x), r11=204(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 128
LDI r1, 1
LDI r2, 440
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 210
LDI r7, 12
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 293
LDI r11, 204
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
