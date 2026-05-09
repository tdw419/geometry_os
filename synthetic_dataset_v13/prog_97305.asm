; DESCRIPTION: Composite: Renders a yellow line between points (336, 55) and (32, 16) then Places a blue dot at position (404, 33) then Places a cyan 15x111 rectangle at position (237, 102).
; PLAN: r0=336(x1), r1=55(y1), r2=32(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=33(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=237(x), r11=102(y), r12=15(width), r13=111(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 55
LDI r2, 32
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 33
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 237
LDI r11, 102
LDI r12, 15
LDI r13, 111
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
