; DESCRIPTION: Composite: Places a white 86x98 rectangle at position (259, 132) then Renders a cyan line between points (326, 108) and (82, 125) then Places a red circle of radius 72 at center (349, 184).
; PLAN: r0=259(x), r1=132(y), r2=86(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x1), r6=108(y1), r7=82(x2), r8=125(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=349(x), r11=184(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 132
LDI r2, 86
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 108
LDI r7, 82
LDI r8, 125
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 349
LDI r11, 184
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
