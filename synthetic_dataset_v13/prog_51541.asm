; DESCRIPTION: Composite: Renders a white line between points (117, 239) and (506, 241) then Places a red 104x46 rectangle at position (211, 39).
; PLAN: r0=117(x1), r1=239(y1), r2=506(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=39(y), r7=104(width), r8=46(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 239
LDI r2, 506
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 39
LDI r7, 104
LDI r8, 46
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
