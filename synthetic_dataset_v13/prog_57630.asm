; DESCRIPTION: Composite: Sets a single green pixel at (243, 135) then Places a red 94x12 rectangle at position (18, 132).
; PLAN: r0=243(x), r1=135(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=18(x), r6=132(y), r7=94(width), r8=12(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 135
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 18
LDI r6, 132
LDI r7, 94
LDI r8, 12
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
