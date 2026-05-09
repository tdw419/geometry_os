; DESCRIPTION: Composite: Places a red 60x86 rectangle at position (273, 137) then Renders a cyan disk with center (217, 62) and radius 11.
; PLAN: r0=273(x), r1=137(y), r2=60(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=62(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 273
LDI r1, 137
LDI r2, 60
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 62
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
