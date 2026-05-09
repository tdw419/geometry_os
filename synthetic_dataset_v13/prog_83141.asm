; DESCRIPTION: Composite: Places a red dot at position (472, 231) then Renders a cyan disk with center (59, 180) and radius 34.
; PLAN: r0=472(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=180(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 472
LDI r1, 231
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 59
LDI r6, 180
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
