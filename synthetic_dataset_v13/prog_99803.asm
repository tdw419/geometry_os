; DESCRIPTION: Composite: Renders a cyan disk with center (173, 171) and radius 16 then Renders a purple box of size 32x43 starting at (272, 99).
; PLAN: r0=173(x), r1=171(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=99(y), r7=32(width), r8=43(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 171
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 99
LDI r7, 32
LDI r8, 43
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
