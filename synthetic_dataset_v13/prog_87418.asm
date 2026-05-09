; DESCRIPTION: Composite: Renders a cyan disk with center (272, 181) and radius 64 then Renders a cyan box of size 70x75 starting at (252, 96).
; PLAN: r0=272(x), r1=181(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x), r6=96(y), r7=70(width), r8=75(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 181
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 96
LDI r7, 70
LDI r8, 75
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
