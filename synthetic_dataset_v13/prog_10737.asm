; DESCRIPTION: Composite: Places a black dot at position (380, 8) then Draws a cyan line from (42, 125) to (346, 243).
; PLAN: r0=380(x), r1=8(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=42(x1), r6=125(y1), r7=346(x2), r8=243(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 8
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 42
LDI r6, 125
LDI r7, 346
LDI r8, 243
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
