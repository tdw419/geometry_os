; DESCRIPTION: Composite: Places a red circle of radius 72 at center (387, 169) then Places a yellow 76x62 rectangle at position (97, 193).
; PLAN: r0=387(x), r1=169(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=193(y), r7=76(width), r8=62(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 169
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 193
LDI r7, 76
LDI r8, 62
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
