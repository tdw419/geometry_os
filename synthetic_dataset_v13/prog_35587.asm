; DESCRIPTION: Composite: Places a red 77x99 rectangle at position (410, 124) then Sets a single green pixel at (221, 155).
; PLAN: r0=410(x), r1=124(y), r2=77(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=155(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 410
LDI r1, 124
LDI r2, 77
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 155
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
