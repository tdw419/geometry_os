; DESCRIPTION: Composite: Places a blue 95x81 rectangle at position (75, 129) then Places a green dot at position (47, 254).
; PLAN: r0=75(x), r1=129(y), r2=95(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=47(x), r6=254(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 129
LDI r2, 95
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 254
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
