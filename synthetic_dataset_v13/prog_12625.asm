; DESCRIPTION: Draws a cyan line from (34, 253) to (394, 151).
; PLAN: r0=34(x1), r1=253(y1), r2=394(x2), r3=151(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 253
LDI r2, 394
LDI r3, 151
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
