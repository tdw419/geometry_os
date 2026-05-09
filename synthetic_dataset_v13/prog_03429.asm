; DESCRIPTION: Composite: Places a red dot at position (24, 204) then Places a red 12x10 rectangle at position (439, 199) then Renders a yellow line between points (403, 18) and (237, 81).
; PLAN: r0=24(x), r1=204(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=439(x), r6=199(y), r7=12(width), r8=10(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=403(x1), r11=18(y1), r12=237(x2), r13=81(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 204
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 439
LDI r6, 199
LDI r7, 12
LDI r8, 10
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 403
LDI r11, 18
LDI r12, 237
LDI r13, 81
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
