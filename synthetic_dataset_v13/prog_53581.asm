; DESCRIPTION: Composite: Places a white 32x105 rectangle at position (139, 47) then Renders a green disk with center (443, 133) and radius 59 then Places a red dot at position (3, 26).
; PLAN: r0=139(x), r1=47(y), r2=32(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x), r6=133(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=3(x), r11=26(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 47
LDI r2, 32
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 133
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 3
LDI r11, 26
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
