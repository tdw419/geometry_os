; DESCRIPTION: Composite: Renders a red disk with center (355, 132) and radius 45 then Places a red 17x112 rectangle at position (298, 8) then Renders a cyan line between points (346, 1) and (202, 36).
; PLAN: r0=355(x), r1=132(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=8(y), r7=17(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x1), r11=1(y1), r12=202(x2), r13=36(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 132
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 8
LDI r7, 17
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 1
LDI r12, 202
LDI r13, 36
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
