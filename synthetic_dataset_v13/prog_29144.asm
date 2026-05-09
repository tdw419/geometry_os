; DESCRIPTION: Composite: Places a yellow 83x120 rectangle at position (305, 118) then Sets a single black pixel at (221, 8).
; PLAN: r0=305(x), r1=118(y), r2=83(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=8(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 118
LDI r2, 83
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 8
LDI r7, 0x000000
PSET r5, r6, r7
HALT
