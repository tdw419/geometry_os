; DESCRIPTION: Composite: Places a blue dot at position (374, 192) then Places a cyan 64x21 rectangle at position (340, 106).
; PLAN: r0=374(x), r1=192(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=106(y), r7=64(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 192
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 340
LDI r6, 106
LDI r7, 64
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
