; DESCRIPTION: Composite: Renders a red disk with center (441, 105) and radius 60 then Places a white 91x80 rectangle at position (281, 173).
; PLAN: r0=441(x), r1=105(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=173(y), r7=91(width), r8=80(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 105
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 173
LDI r7, 91
LDI r8, 80
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
