; DESCRIPTION: Composite: Renders a cyan disk with center (297, 197) and radius 43 then Places a red 34x11 rectangle at position (184, 88) then Places a cyan dot at position (387, 246).
; PLAN: r0=297(x), r1=197(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=88(y), r7=34(width), r8=11(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=387(x), r11=246(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 297
LDI r1, 197
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 88
LDI r7, 34
LDI r8, 11
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 246
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
