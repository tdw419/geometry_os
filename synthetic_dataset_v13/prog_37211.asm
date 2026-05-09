; DESCRIPTION: Draws a cyan line from (87, 172) to (354, 28).
; PLAN: r0=87(x1), r1=172(y1), r2=354(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 172
LDI r2, 354
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
