; DESCRIPTION: Composite: Places a purple dot at position (158, 209) then Places a cyan 59x88 rectangle at position (432, 25).
; PLAN: r0=158(x), r1=209(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=25(y), r7=59(width), r8=88(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 209
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 432
LDI r6, 25
LDI r7, 59
LDI r8, 88
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
