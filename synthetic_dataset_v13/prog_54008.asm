; DESCRIPTION: Composite: Renders a white disk with center (191, 103) and radius 52 then Places a red dot at position (382, 112) then Places a yellow 61x90 rectangle at position (425, 46).
; PLAN: r0=191(x), r1=103(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=112(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=425(x), r11=46(y), r12=61(width), r13=90(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 103
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 112
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 425
LDI r11, 46
LDI r12, 61
LDI r13, 90
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
