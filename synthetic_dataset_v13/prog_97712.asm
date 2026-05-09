; DESCRIPTION: Composite: Renders a cyan disk with center (146, 103) and radius 39 then Renders a white box of size 60x55 starting at (27, 4).
; PLAN: r0=146(x), r1=103(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x), r6=4(y), r7=60(width), r8=55(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 103
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 4
LDI r7, 60
LDI r8, 55
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
