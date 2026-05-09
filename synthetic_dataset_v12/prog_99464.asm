; DESCRIPTION: Composite: Draws a white line from (426, 233) to (228, 1) then Places a red circle of radius 40 at center (175, 125).
; PLAN: r0=426(x1), r1=233(y1), r2=228(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=125(y), r7=40(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 426
LDI r1, 233
LDI r2, 228
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 125
LDI r7, 40
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
