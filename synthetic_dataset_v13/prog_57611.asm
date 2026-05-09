; DESCRIPTION: Composite: Places a green dot at position (20, 54) then Places a green 21x24 rectangle at position (81, 75).
; PLAN: r0=20(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=75(y), r7=21(width), r8=24(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 20
LDI r1, 54
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 81
LDI r6, 75
LDI r7, 21
LDI r8, 24
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
