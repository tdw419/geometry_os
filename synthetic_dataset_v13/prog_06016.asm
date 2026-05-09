; DESCRIPTION: Draws a cyan line from (394, 60) to (178, 232).
; PLAN: r0=394(x1), r1=60(y1), r2=178(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 60
LDI r2, 178
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
