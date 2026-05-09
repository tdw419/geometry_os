; DESCRIPTION: Composite: Places a green circle of radius 31 at center (126, 77) then Places a cyan dot at position (75, 3) then Places a red 98x28 rectangle at position (269, 210).
; PLAN: r0=126(x), r1=77(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=3(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=269(x), r11=210(y), r12=98(width), r13=28(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 77
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 3
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 269
LDI r11, 210
LDI r12, 98
LDI r13, 28
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
