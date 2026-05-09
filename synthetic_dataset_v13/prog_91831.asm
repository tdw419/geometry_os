; DESCRIPTION: Composite: Draws a cyan line from (431, 249) to (460, 42) then Places a purple dot at position (328, 221).
; PLAN: r0=431(x1), r1=249(y1), r2=460(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=221(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 431
LDI r1, 249
LDI r2, 460
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 221
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
