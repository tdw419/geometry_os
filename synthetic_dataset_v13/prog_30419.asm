; DESCRIPTION: Composite: Places a blue dot at position (395, 22) then Places a cyan 24x68 rectangle at position (374, 64).
; PLAN: r0=395(x), r1=22(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=64(y), r7=24(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 22
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 64
LDI r7, 24
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
