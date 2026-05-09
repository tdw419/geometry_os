; DESCRIPTION: Composite: Places a yellow dot at position (82, 213) then Places a cyan circle of radius 40 at center (387, 176) then Places a white 96x96 rectangle at position (122, 48).
; PLAN: r0=82(x), r1=213(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=176(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x), r11=48(y), r12=96(width), r13=96(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 213
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 387
LDI r6, 176
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 48
LDI r12, 96
LDI r13, 96
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
