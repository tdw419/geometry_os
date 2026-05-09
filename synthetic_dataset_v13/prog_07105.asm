; DESCRIPTION: Composite: Places a orange dot at position (59, 21) then Draws a cyan line from (255, 226) to (291, 90).
; PLAN: r0=59(x), r1=21(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=255(x1), r6=226(y1), r7=291(x2), r8=90(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 21
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 255
LDI r6, 226
LDI r7, 291
LDI r8, 90
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
