; DESCRIPTION: Composite: Renders a cyan disk with center (275, 101) and radius 70 then Places a green 36x90 rectangle at position (391, 93).
; PLAN: r0=275(x), r1=101(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=93(y), r7=36(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 101
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 93
LDI r7, 36
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
