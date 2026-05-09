; DESCRIPTION: Composite: Places a cyan line segment connecting (213, 239) to (288, 216) then Places a white dot at position (244, 136).
; PLAN: r0=213(x1), r1=239(y1), r2=288(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=136(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 213
LDI r1, 239
LDI r2, 288
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 136
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
