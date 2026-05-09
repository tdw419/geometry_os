; DESCRIPTION: Composite: Renders a white line between points (336, 107) and (291, 211) then Places a cyan 88x98 rectangle at position (417, 15).
; PLAN: r0=336(x1), r1=107(y1), r2=291(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=15(y), r7=88(width), r8=98(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 107
LDI r2, 291
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 15
LDI r7, 88
LDI r8, 98
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
