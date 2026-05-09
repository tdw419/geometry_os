; DESCRIPTION: Draws a cyan line from (279, 96) to (394, 98).
; PLAN: r0=279(x1), r1=96(y1), r2=394(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 96
LDI r2, 394
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
