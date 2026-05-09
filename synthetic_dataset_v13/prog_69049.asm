; DESCRIPTION: Composite: Renders a green disk with center (349, 97) and radius 29 then Places a red 95x99 rectangle at position (374, 18).
; PLAN: r0=349(x), r1=97(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=18(y), r7=95(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 97
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 18
LDI r7, 95
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
