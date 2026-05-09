; DESCRIPTION: Composite: Places a cyan dot at position (173, 196) then Draws a blue circle centered at (317, 106) with radius 19 then Draws a red line from (298, 129) to (297, 135).
; PLAN: r0=173(x), r1=196(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=106(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=298(x1), r11=129(y1), r12=297(x2), r13=135(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 196
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 317
LDI r6, 106
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 298
LDI r11, 129
LDI r12, 297
LDI r13, 135
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
