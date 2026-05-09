; DESCRIPTION: Composite: Draws a purple circle centered at (81, 71) with radius 38 then Places a green 120x77 rectangle at position (373, 113) then Places a cyan dot at position (460, 170).
; PLAN: r0=81(x), r1=71(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x), r6=113(y), r7=120(width), r8=77(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=460(x), r11=170(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 71
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 113
LDI r7, 120
LDI r8, 77
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 170
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
