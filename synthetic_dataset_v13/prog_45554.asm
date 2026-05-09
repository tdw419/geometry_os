; DESCRIPTION: Composite: Places a white dot at position (298, 120) then Renders a black disk with center (420, 54) and radius 50 then Draws a red line from (52, 134) to (406, 253).
; PLAN: r0=298(x), r1=120(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=54(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=52(x1), r11=134(y1), r12=406(x2), r13=253(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 298
LDI r1, 120
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 54
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 52
LDI r11, 134
LDI r12, 406
LDI r13, 253
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
