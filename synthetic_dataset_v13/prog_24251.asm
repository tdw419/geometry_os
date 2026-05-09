; DESCRIPTION: Composite: Places a blue dot at position (468, 112) then Places a yellow 78x17 rectangle at position (425, 237).
; PLAN: r0=468(x), r1=112(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=237(y), r7=78(width), r8=17(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 468
LDI r1, 112
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 425
LDI r6, 237
LDI r7, 78
LDI r8, 17
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
