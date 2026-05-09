; DESCRIPTION: Composite: Places a yellow circle of radius 39 at center (470, 143) then Places a cyan dot at position (398, 221).
; PLAN: r0=470(x), r1=143(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x), r6=221(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 470
LDI r1, 143
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 221
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
