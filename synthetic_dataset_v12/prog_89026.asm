; DESCRIPTION: Composite: Renders a purple disk with center (211, 61) and radius 18 then Renders a cyan box of size 16x45 starting at (195, 146).
; PLAN: r0=211(x), r1=61(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x), r6=146(y), r7=16(width), r8=45(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 61
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 146
LDI r7, 16
LDI r8, 45
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
