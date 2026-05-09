; DESCRIPTION: Composite: Places a red dot at position (415, 220) then Draws a blue circle centered at (470, 151) with radius 42.
; PLAN: r0=415(x), r1=220(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=470(x), r6=151(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 415
LDI r1, 220
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 470
LDI r6, 151
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
