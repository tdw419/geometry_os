; DESCRIPTION: Composite: Places a green dot at position (400, 30) then Places a cyan 78x21 rectangle at position (125, 230).
; PLAN: r0=400(x), r1=30(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=230(y), r7=78(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 30
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 125
LDI r6, 230
LDI r7, 78
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
