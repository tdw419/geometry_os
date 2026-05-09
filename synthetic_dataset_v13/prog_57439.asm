; DESCRIPTION: Composite: Draws a white line from (285, 205) to (224, 93) then Places a black dot at position (440, 16).
; PLAN: r0=285(x1), r1=205(y1), r2=224(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=16(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 285
LDI r1, 205
LDI r2, 224
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 16
LDI r7, 0x000000
PSET r5, r6, r7
HALT
