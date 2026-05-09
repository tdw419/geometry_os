; DESCRIPTION: Composite: Renders a green box of size 16x80 starting at (170, 6) then Places a white dot at position (52, 223).
; PLAN: r0=170(x), r1=6(y), r2=16(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=223(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 170
LDI r1, 6
LDI r2, 16
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 223
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
