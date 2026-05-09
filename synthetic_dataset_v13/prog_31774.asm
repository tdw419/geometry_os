; DESCRIPTION: Composite: Places a blue dot at position (177, 222) then Places a cyan 68x59 rectangle at position (426, 115).
; PLAN: r0=177(x), r1=222(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=426(x), r6=115(y), r7=68(width), r8=59(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 177
LDI r1, 222
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 426
LDI r6, 115
LDI r7, 68
LDI r8, 59
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
