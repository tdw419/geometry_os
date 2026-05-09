; DESCRIPTION: Composite: Places a green circle of radius 77 at center (307, 89) then Places a green 51x44 rectangle at position (240, 19).
; PLAN: r0=307(x), r1=89(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=19(y), r7=51(width), r8=44(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 89
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 19
LDI r7, 51
LDI r8, 44
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
